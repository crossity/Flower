#include <iostream>
#include <vector>
#include <fstream>
#include <string>

using namespace std;

struct LINK {
	string name;
	int PTR;
	LINK(string a, int b) {
		this->name = a;
		this->PTR = b;
	}
};

void ERROR(string error) {
	cout << endl << "\x1b[31mERROR:" << error << "\x1b[30m" << endl;
}

vector<string> file_to_words(string path);

string find(vector<LINK> links, vector<string> words, ofstream &output, string reg);
void math_to_asm(vector<LINK> links, vector<string> words, ofstream &output, string reg);

int build(string path);

char SingleChars[13] = {
	'(', ')', '{', '}', '[', ']', ';', ':', '\n', ',', '.', '$', '#'
};

int SingleCharsSize = 13;

int PTR = 208;
 
int main(const int argc, char **argv) {
	if (argc > 1)
		return build(argv[1]);
	else
		return build("test.f");
	return 0;
}

vector<string> file_to_words(string path) {
	vector<string> words;
	ifstream file(path);
	if (!file.is_open())
		ERROR("no such file or directory '" + path + "'");
	string str;
	string word;
	vector<string> strings;
	while (getline(file, str))
		strings.push_back(str + "\n");
	file.close();
	for (int j = 0; j < strings.size(); j++) {
		str = strings[j];
		for (int i = 0; i < str.size(); i++) {
			bool single = false;
			for (int h = 0; h < SingleCharsSize; h++) {
				if (str[i] == SingleChars[h]) {
					single = true;
					break;
				}
			}
			if (str[i] == '\"') {
				string s;
				word += str[i];
				i++;
				while (str[i] != '\"') {
					word += str[i];
					i++;
				}
				word += str[i];
				words.push_back(word);
				word = "";
			}
			else if (str[i] == '\'') {
				string s;
				word += str[i];
				i++;
				while (str[i] != '\'') {
					word += str[i];
					i++;
				}
				word += str[i];
				words.push_back(word);
				word = "";
			}
			else if (str[i] == '/' && str[i + 1] == '/') {
				words.push_back("\n");
				break;
			}
			else if (single) {
				if (word != "") {
					words.push_back(word);
					word = "";
				}
				word = str[i];
				words.push_back(word);
				word = "";
			}
			else if (str[i] != ' ' && str[i] != '\t')
				word += str[i];
			else {
				if (word != "") {
					words.push_back(word);
					word = "";
				}
			}
			if (i == str.size() - 1) {
				if (word != "") {
					words.push_back(word);
					word = "";
				}
			}
		}
	}
	return words;
}

string find(vector<LINK> links, vector<string> words, ofstream &output, string reg) {
	if (words[0][0] == '1' || words[0][0] == '2' || words[0][0] == '3' ||
		words[0][0] == '4' || words[0][0] == '5' || words[0][0] == '6' ||
		words[0][0] == '7' || words[0][0] == '8' || words[0][0] == '9' ||
		words[0][0] == '0' || words[0][0] == '-') {
		return words[0];
	}
	else if (words[0] == "true" || words[0] == "True" || words[0] == "TRUE")
		return "1";
	else if (words[0] == "false" || words[0] == "False" || words[0] == "FALSE")
		return "0";
	else if (words[0][0] == 39) { //'
		string ch;
		for (int i = 1; i < words[0].size() - 1; i++)
			ch += words[0][i];
		if (ch.size() == 1)
			return to_string((int)ch[0]);
		else {
			if (ch[0] == '\\') {
				if (ch[1] == 'n')
					return "10";
				if (ch[1] == 't')
					return "9";
			}
		}
		return "";
	}
	else if (words[0] == "$") {
		if (words[2] != "["){
			for (int i = links.size() - 1; i >= 0; i--) {
				if (words[1] == links[i].name) {
					output << "    mov r12, rbp\n";
					output << "    sub r12, " << to_string(links[i].PTR) << "\n";
					return "r12";
				}
			}
			return words[1];
		}
		else if (words[2] == "[") {
			int bit;
			if (reg == "r")
				bit = 8;
			else if (reg == "e")
				bit = 4;
			vector<string> W;
			string name = words[1];
			int ptr = 4;
			int scopes = -1;
			for (int i = 3; scopes != 0 && i < words.size(); i++) {
				if (words[i] == "[")
					scopes--;
				else if (words[i] == "]")
					scopes++;
				W.push_back(words[i]);
			}
			for (int i = links.size() - 1; i >= 0; i--) {
				if (links[i].name == name) {
					ptr = links[i].PTR;
					break;
				}
			}
			math_to_asm(links, W, output, "r");
			output << "    imul rax, rax, " << bit << "\n";
			output << "    add rax, " << ptr << "\n";
			output << "    lea rbx, [rbp]\n";
			output << "    sub rbx, rax\n";
			return "rbx";
		}
	}
	else if (words[0] == "#") {
		if (words[2] != "["){
			for (int i = links.size() - 1; i >= 0; i--) {
				if (words[1] == links[i].name) {
					output << "    mov r13, QWORD [rbp - " << to_string(links[i].PTR) << "]\n";
					return "QWORD [r13]";
				}
			}
			return words[0];
		}
	}
	else if (words[1] != "["){
		for (int i = links.size() - 1; i >= 0; i--) {
			if (words[0] == links[i].name) {
				return "QWORD [rbp - " + to_string(links[i].PTR) + "]";
			}
		}
		return words[0];
	}
	else if (words[1] == "[") {
		int bit;
		if (reg == "r")
			bit = 8;
		else if (reg == "e")
			bit = 4;
		vector<string> W;
		string name = words[0];
		int ptr = 4;
		int scopes = -1;
		for (int i = 2; scopes != 0 && i < words.size(); i++) {
			if (words[i] == "[")
				scopes--;
			else if (words[i] == "]")
				scopes++;
			W.push_back(words[i]);
		}
		for (int i = links.size() - 1; i >= 0; i--) {
			if (links[i].name == name) {
				ptr = links[i].PTR;
				break;
			}
		}
		math_to_asm(links, W, output, "r");
		output << "    imul rax, rax, " << bit << "\n";
		output << "    add rax, " << ptr << "\n";
		output << "    lea rbx, [rbp]\n";
		output << "    sub rbx, rax\n";
		return "QWORD [rbx]";
	}
	return "";
}

void math_to_asm(vector<LINK> links, vector<string> words, ofstream &output, string reg) {
	vector<string> nums;
	vector<string> signs;
	vector<string> num;
	for (int i = 0; i < words.size(); i++) {
		if (words[i] == "[") {
			int scopes = -1;
			while (scopes != 0) {
				num.push_back(words[i]);
				i++;
				if (words[i] == "[")
					scopes--;
				else if (words[i] == "]")
					scopes++;
			}
			num.push_back(words[i]);
			nums.push_back(find(links, num, output, reg));
			while (num.size() > 0)
				num.pop_back();
		}
		else if (words[i] != "%" && words[i] != "-" && words[i] != "+" && words[i] != "*" && words[i] != "/") {
			num.push_back(words[i]);
		}
		else {
			if (num.size() > 0)
				nums.push_back(find(links, num, output, reg));
			while (num.size() > 0)
				num.pop_back();
			signs.push_back(words[i]);
		}
		if (i == words.size() - 1) {
			if (num.size() > 0)
				nums.push_back(find(links, num, output, reg));
			while (num.size() > 0)
				num.pop_back();
		}
	}

	//for (int i = 0; i < nums.size(); i++)
	//	cout << "num "<< nums[i] << " ";
	//cout << ", ";
	//for (int i = 0; i < signs.size(); i++)
	//	cout << "sign " << signs[i] << " ";
	//cout << endl;
	
	output << "    mov " << reg << "ax, " << nums[0] << "\n";
	for (int i = 0; i < signs.size(); i++) {
		if (signs[i] == "+")
			output << "    add " << reg << "ax, " << nums[i + 1] << "\n";
		else if (signs[i] == "-")
			output << "    sub " << reg << "ax, " << nums[i + 1] << "\n";
		else if (signs[i] == "*") {
			output << "    mov " << reg << "bx, " << nums[i + 1] << "\n";
			output << "    imul " << reg << "bx\n";
		}
		else if (signs[i] == "/")  {
			output << "    xor " << reg << "dx, " << reg << "dx\n";
			output << "    mov " << reg << "bx, " << nums[i + 1] << "\n";
			output << "    div " << reg << "bx\n";
		}
		else if (signs[i] == "%")  {
			output << "    xor " << reg << "dx, " << reg << "dx\n";
			output << "    mov " << reg << "bx, " << nums[i + 1] << "\n";
			output << "    div " << reg << "bx\n";
			output << "    mov " << reg << "ax, " << reg << "dx\n";
		}
 	}
}

int build(string path) {
	vector<LINK> links;
	int msgnum = 1;
	int ifnum = 1;
	vector<int> ifs;
	int whilenum = 1;
	vector<int> whils;
	string AfterWords = "";
	vector<string> words = file_to_words(path);
	string asmpath;
	for (int i = 0; i < path.size() - 2; i++)
		asmpath += path[i];
	asmpath += ".asm";

	ofstream output(asmpath);

	cout << "==";

	// CODE
	output << "global _main\n";
	output << "\n";

	output << "NEGATIVEMESSEGE: db \"-\"\n";
	output << "ZEROMESSEGE: db \"0\"\n";

    int w = 0;
    for (; w < words.size() && !(words[w] == "=>" && words[w - 1] == "_main" && words[w - 2] == "fn"); w++) {
    	if (words[w] == "const") {
    		if (words[w + 1] == "string") {
	    		w += 2;
	    		string name = words[w];
	    		output << name << ": db ";
	    		vector<string> W;
	    		w++;
	    		while (words[w] != "end") {
	    			W.push_back(words[w]);
	    			w++;
	    		}
	    		for (int i = 0; i < W.size() - 1; i++)
	    			output << W[i] << ", ";
	    		output << W[W.size() - 1] << "\n";
	    		output << name << "Size: equ $ - " << name << "\n";
    		}
			else if (words[w + 1] == "int") {
				w += 2;
				string name = words[w];
				output << name << ": equ " << words[w + 1] << "\n";
				w++;
			}
    	}
    	else if (words[w] == "import") {
    		w++;
    		if (words[w][0] != '"') {
    			string msg = "expected ';', got ';'";
    			msg[10] = 34;
    			msg[19] = words[w][0];
    			ERROR(msg);
    			return 1;
    		}
    		string impoortpath;
    		vector<string> W;
    		for (int i = 1; i < words[w].size() - 1; i++)
    			impoortpath += words[w][i];
    		W = file_to_words(impoortpath);
    		for (int i = 0; i < W.size(); i++)
    			words.push_back(W[i]);
    	}
    }
    if (!(words[w] == "=>" && words[w - 1] == "_main" && words[w - 2] == "fn")) {
    	ERROR("no main function");
    	return 69;
    }
    cout << "==";
    output << "\n";
	output << "_main:\n";
	output << "    push rbp\n";
    output << "    mov rbp, rsp\n";
    output << "    mov r11, 16\n";
	for (; w < words.size(); w++) {
		if (words[w] == "int" || words[w] == "char") {
			if (words[w + 1] == "[") {
				int size = stoi(words[w + 2]);
				w += 4;
				links.push_back(LINK(words[w], PTR));
				if (words[w + 1] == "=") {
					w += 2;
					if (words[w] == "{") {
						output << "\n";
						w++;
						for (int i = 0; i < size; i++) {
							vector<string> W;
							while (words[w] != "," && words[w] != "}") {
								W.push_back(words[w]);
								w++;
								if (words[w] == "\n") {
									ERROR("expected '}'");
									return 1;
								}
							}
							w++;
							math_to_asm(links, W, output, "r");
							output << "    mov QWORD [rbp - " << to_string(PTR) << "], rax\n";
							PTR += 8;
						}
					}
					else if (words[w][0] == 34) { // "
						output << "\n";
						for (int i = 0; i < size; i++) {
							vector<string> W;
							W.push_back(to_string(words[w][i + 1]));
							math_to_asm(links, W, output, "r");
							output << "    mov QWORD [rbp - " << to_string(PTR) << "], rax\n";
							PTR += 8;
						}
					}
					else {
						vector<string> W;
						while (words[w] != "\n") {
							W.push_back(words[w]);
							w++;
						}
						output << "\n";
						math_to_asm(links, W, output, "r");
						for (int i = 0; i < size; i++) {
							output << "    mov QWORD [rbp - " << to_string(PTR) << "], rax\n";
							PTR += 8;
						}
					}
				}
				else {
					for (int i = 0; i < size - 1; i++) {
						output << "    mov QWORD [rbp - " << to_string(PTR) << "], 0\n";
						PTR += 8;
					}
					output << "    mov QWORD [rbp - " << to_string(PTR) << "], 0\n";
					PTR += 8;
				}
			}
			else {
				w++;
				links.push_back(LINK(words[w], PTR));
				if (words[w + 1] == "=") {
					w += 2;
					vector<string> W;
					while (words[w] != "\n") {
						W.push_back(words[w]);
						w++;
					}
					output << "\n";
					math_to_asm(links, W, output, "r");
					output << "    mov QWORD [rbp - " << PTR << "], rax\n";
				}
				else
					output << "    mov QWORD [rbp - " << PTR << "], 0\n";
				PTR += 8;
			}
		}
		else if (words[w] == "mem") {
			w++;
			vector<string> W;
			while (words[w] != ",") {
				W.push_back(words[w]);
				w++;
			}
			math_to_asm(links, W, output, "r");
			output << "    mov rbx, rax\n";
			w++;
			while (W.size() > 0)
				W.pop_back();
			while (words[w] != "\n") {
				W.push_back(words[w]);
				w++;
			}
			math_to_asm(links, W, output, "r");
			output << "    mov BYTE [rbx], al\n";
		}
		else if (words[w] == "print") {
			vector<string> W;
			w++;
			while (words[w] != "\n") {
				W.push_back(words[w]);
				w++;
			}
			W.push_back(words[w]);
			for (int i = 0; i < W.size(); i++) {
				if (W[i][0] == '\"') {
					output << "\n";
					AfterWords += "msg" + to_string(msgnum) + ": db " + W[i] + "\n";
					output << "    mov rax, 0x2000004\n";
					output << "    mov rdi, 1\n";
					output << "    mov rsi, msg" << to_string(msgnum) << "\n";
					output << "    mov rdx, " << W[i].size() - 2 << "\n";
					output << "    syscall\n";
					msgnum++;
				}
				else if (W[i] == "endl") {
					output << "\n";
					AfterWords += "msg" + to_string(msgnum) + ": db 10\n";
					output << "    mov rax, 0x2000004\n";
					output << "    mov rdi, 1\n";
					output << "    mov rsi, msg" << to_string(msgnum) << "\n";
					output << "    mov rdx, 1\n";
					output << "    syscall\n";
					msgnum++;
				}
				else if (W[i] == "int") {
					i++;
					vector<string> W2;
					while (W[i] != "\n" && W[i] != "string" && W[i] != "int" && W[i][0] != '\"' && W[i] != "endl" && W[i] != "char") {
						W2.push_back(W[i]);
						i++;
					}
					//for (int i = 0; i < W2.size(); i++)
					//	cout << W2[i] << endl;
					i--;
					output << "\n";
					math_to_asm(links, W2, output, "r");
					output << "    xor rcx, rcx\n";
    				output << "    mov r14, 4\n";
					output << "    mov r13, rax\n";
					output << "    cmp r13, 0\n";
    				output << "    jge .NEGATIVECHECKEND" << to_string(msgnum) << "\n";
    				output << "    mov rax, 0x2000004\n";
    				output << "    mov rdi, 1\n";
    				output << "    mov rsi, NEGATIVEMESSEGE\n";
    				output << "    mov rdx, 1\n";
    				output << "    syscall\n";
    				output << "    imul r13, r13, -1\n";
    				output << "    .NEGATIVECHECKEND" << to_string(msgnum) << ":\n";
    				output << "    cmp r13, 0\n";
    				output << "    jne .ZEROCHECKEND" << to_string(msgnum) << "\n";
    				output << "    mov rax, 0x2000004\n";
    				output << "    mov rdi, 1\n";
    				output << "    mov rsi, ZEROMESSEGE\n";
    				output << "    mov rdx, 1\n";
    				output << "    syscall\n";
    				output << "    .ZEROCHECKEND" << to_string(msgnum) << ":\n";
					output << "    .PRINT" << to_string(msgnum) << ":\n";
    				output << "    cmp r13, 0\n";
    				output << "    jle .L" << to_string(msgnum) << "\n";
    				output << "    mov rax, r13\n";
    				output << "    xor rdx, rdx\n";
    				output << "    mov rbx, 10\n";
    		    	output << "    div rbx\n";
    				output << "    mov r13, rax\n";
    		    	output << "    add rdx, 48\n";
    				output << "    mov r10, rbp\n";
    				output << "    add r10, r14\n";
    				output << "    add r14, 8\n";
    				output << "    mov QWORD [r10], rdx\n";
    				output << "    jmp .PRINT" << to_string(msgnum) << "\n";
    			    output << "    .L" << to_string(msgnum) << ":\n";
    				output << "    sub r14, 8\n";
    				output << "    .Convert" << to_string(msgnum) << ":\n";
    				output << "    cmp r14, 0\n";
    				output << "    jl .END" << to_string(msgnum) << "\n";
    				output << "    mov r10, rbp\n";
    				output << "    add r10, r14\n";
    				output << "    sub r14, 8\n";
    				output << "    mov rdx, r10\n";
    				output << "    mov rax, 0x2000004\n";
    				output << "    mov rdi, 1\n";
    				output << "    mov rsi, rdx\n";
    				output << "    mov rdx, 1\n";
    				output << "    syscall\n";
    				output << "    jmp .Convert" << to_string(msgnum) << "\n";
    				output << "    .END" << to_string(msgnum) << ":\n";

					msgnum++;
				}
				else if (W[i] == "char") {
					i++;
					vector<string> W2;
					while (W[i] != "\n" && W[i] != "string" && W[i] != "int" && W[i][0] != '\"' && W[i] != "endl" && W[i] != "char") {
						W2.push_back(W[i]);
						i++;
					}
					i--;
					output << "\n";
					math_to_asm(links, W2, output, "r");
					output << "    mov BYTE [rbp + 8], al\n";
					output << "    mov rdx, rbp\n";
					output << "    add rdx, 8\n";
					output << "    mov rax, 0x2000004\n";
					output << "    mov rdi, 1\n";
					output << "    mov rsi, rdx\n";
					output << "    mov rdx, 1\n";
					output << "    syscall\n";
				}
				else if (W[i] == "string") {
					i++;
					output << "\n";
					output << "    mov rax, 0x2000004\n";
					output << "    mov rdi, 1\n";
					output << "    mov rsi, " << W[i] << "\n";
					output << "    mov rdx, " << W[i] << "Size\n";
					output << "    syscall\n";
				}
				else if (W[i] != "\n") {
					ERROR("unexpected expresion '" + W[i] + "' with 'print' function");
					return 1;
				}
			}
		}
		else if (words[w + 1] == "=") {
			if (words[w + 2] == "\n") {
				ERROR("expected something after '='");
				return 1;
			}
			vector<string> W2;
			if (words[w] == "]") {
				int scopes = 1;
				int i = w - 1;
				while (scopes != 0) {
					if (words[i] == "]")
						scopes++;
					else if (words[i] == "[")
						scopes--;
					i--;
				}
				scopes = -1;
				W2.push_back(words[i]);
				W2.push_back(words[i + 1]);
				i += 2;
				while (scopes != 0) {
					if (words[i] == "[")
						scopes--;
					else if (words[i] == "]")
						scopes++;
					W2.push_back(words[i]);
					i++;
				}
			}
			W2.push_back(words[w]);
			w += 2;
			vector<string> W;
			while (words[w] != "\n") {
				W.push_back(words[w]);
				w++;
			}
			//for (int i = 0; i < W2.size(); i++)
			//	cout << W2[i] << " ";
			//cout << "= ";
			//for (int i = 0; i < W.size(); i++)
			//	cout << W[i] << " ";
			//cout << endl;
			output << "\n";
			string ret = find(links, W2, output, "r");
			math_to_asm(links, W, output, "r");
			output << "    mov " << ret << ", rax\n";
		}
		else if (words[w + 1] == "+=") {
			if (words[w + 2] == "\n") {
				ERROR("expected something after '+='");
				return 1;
			}
			vector<string> W2;
			if (words[w] == "]") {
				int scopes = 1;
				int i = w - 1;
				while (scopes != 0) {
					if (words[i] == "]")
						scopes++;
					else if (words[i] == "[")
						scopes--;
					i--;
				}
				scopes = -1;
				W2.push_back(words[i]);
				W2.push_back(words[i + 1]);
				i += 2;
				while (scopes != 0) {
					if (words[i] == "[")
						scopes--;
					else if (words[i] == "]")
						scopes++;
					W2.push_back(words[i]);
					i++;
				}
			}
			W2.push_back(words[w]);
			w += 2;
			vector<string> W;
			while (words[w] != "\n") {
				W.push_back(words[w]);
				w++;
			}
			//for (int i = 0; i < W2.size(); i++)
			//	cout << W2[i] << " ";
			//cout << "= ";
			//for (int i = 0; i < W.size(); i++)
			//	cout << W[i] << " ";
			//cout << endl;
			output << "\n";
			string ret = find(links, W2, output, "r");
			math_to_asm(links, W, output, "r");
			output << "    add " << ret << ", rax\n";
		}
		else if (words[w + 1] == "-=") {
			if (words[w + 2] == "\n") {
				ERROR("expected something after '-='");
				return 1;
			}
			vector<string> W2;
			if (words[w] == "]") {
				int scopes = 1;
				int i = w - 1;
				while (scopes != 0) {
					if (words[i] == "]")
						scopes++;
					else if (words[i] == "[")
						scopes--;
					i--;
				}
				scopes = -1;
				W2.push_back(words[i]);
				W2.push_back(words[i + 1]);
				i += 2;
				while (scopes != 0) {
					if (words[i] == "[")
						scopes--;
					else if (words[i] == "]")
						scopes++;
					W2.push_back(words[i]);
					i++;
				}
			}
			W2.push_back(words[w]);
			w += 2;
			vector<string> W;
			while (words[w] != "\n") {
				W.push_back(words[w]);
				w++;
			}
			//for (int i = 0; i < W2.size(); i++)
			//	cout << W2[i] << " ";
			//cout << "= ";
			//for (int i = 0; i < W.size(); i++)
			//	cout << W[i] << " ";
			//cout << endl;
			output << "\n";
			string ret = find(links, W2, output, "r");
			math_to_asm(links, W, output, "r");
			output << "    sub " << ret << ", rax\n";
		}
		else if (words[w + 1] == "*=") {
			if (words[w + 2] == "\n") {
				ERROR("expected something after '*='");
				return 1;
			}
			vector<string> W2;
			if (words[w] == "]") {
				int scopes = 1;
				int i = w - 1;
				while (scopes != 0) {
					if (words[i] == "]")
						scopes++;
					else if (words[i] == "[")
						scopes--;
					i--;
				}
				scopes = -1;
				W2.push_back(words[i]);
				W2.push_back(words[i + 1]);
				i += 2;
				while (scopes != 0) {
					if (words[i] == "[")
						scopes--;
					else if (words[i] == "]")
						scopes++;
					W2.push_back(words[i]);
					i++;
				}
			}
			W2.push_back(words[w]);
			w += 2;
			vector<string> W;
			while (words[w] != "\n") {
				W.push_back(words[w]);
				w++;
			}
			//for (int i = 0; i < W2.size(); i++)
			//	cout << W2[i] << " ";
			//cout << "= ";
			//for (int i = 0; i < W.size(); i++)
			//	cout << W[i] << " ";
			//cout << endl;
			output << "\n";
			string ret = find(links, W2, output, "r");
			math_to_asm(links, W, output, "r");
			output << "    imul " << ret << "\n";
			output << "    mov " << ret << ", rax\n";
		}
		else if (words[w + 1] == "/=") {
			if (words[w + 2] == "\n") {
				ERROR("expected something after '/='");
				return 1;
			}
			vector<string> W2;
			if (words[w] == "]") {
				int scopes = 1;
				int i = w - 1;
				while (scopes != 0) {
					if (words[i] == "]")
						scopes++;
					else if (words[i] == "[")
						scopes--;
					i--;
				}
				scopes = -1;
				W2.push_back(words[i]);
				W2.push_back(words[i + 1]);
				i += 2;
				while (scopes != 0) {
					if (words[i] == "[")
						scopes--;
					else if (words[i] == "]")
						scopes++;
					W2.push_back(words[i]);
					i++;
				}
			}
			W2.push_back(words[w]);
			w += 2;
			vector<string> W;
			while (words[w] != "\n") {
				W.push_back(words[w]);
				w++;
			}
			//for (int i = 0; i < W2.size(); i++)
			//	cout << W2[i] << " ";
			//cout << "= ";
			//for (int i = 0; i < W.size(); i++)
			//	cout << W[i] << " ";
			//cout << endl;
			output << "\n";
			string ret = find(links, W2, output, "r");
			math_to_asm(links, W, output, "r");
			output << "    xor rdx, rdx\n";
			output << "    mov rbx, rax\n";
			output << "    mov rax, " << ret << "\n";
			output << "    div rbx\n";
			output << "    mov " << ret << ", rax\n";
		}
		else if (words[w + 1] == "%=") {
			if (words[w + 2] == "\n") {
				ERROR("expected something after '%='");
				return 1;
			}
			vector<string> W2;
			if (words[w] == "]") {
				int scopes = 1;
				int i = w - 1;
				while (scopes != 0) {
					if (words[i] == "]")
						scopes++;
					else if (words[i] == "[")
						scopes--;
					i--;
				}
				scopes = -1;
				W2.push_back(words[i]);
				W2.push_back(words[i + 1]);
				i += 2;
				while (scopes != 0) {
					if (words[i] == "[")
						scopes--;
					else if (words[i] == "]")
						scopes++;
					W2.push_back(words[i]);
					i++;
				}
			}
			W2.push_back(words[w]);
			w += 2;
			vector<string> W;
			while (words[w] != "\n") {
				W.push_back(words[w]);
				w++;
			}
			//for (int i = 0; i < W2.size(); i++)
			//	cout << W2[i] << " ";
			//cout << "= ";
			//for (int i = 0; i < W.size(); i++)
			//	cout << W[i] << " ";
			//cout << endl;
			output << "\n";
			string ret = find(links, W2, output, "r");
			math_to_asm(links, W, output, "r");
			output << "    xor rdx, rdx\n";
			output << "    mov rbx, rax\n";
			output << "    mov rax, " << ret << "\n";
			output << "    div rbx\n";
			output << "    mov " << ret << ", rdx\n";
		}
		else if (words[w] == "if") {
			output << "\n";
			w++;
			string sign;
			vector<string> W;
			while (words[w] != "==" && words[w] != "!=" &&
				   words[w] != "<"  && words[w] != ">"  &&
				   words[w] != "<=" && words[w] != ">=") {
				W.push_back(words[w]);
				w++;
				if (words[w] == "=>" || words[w] == "\n") {
					ERROR("expected bool expresion with 'if'");
					return 1;
				}
			}
			sign = words[w];
			math_to_asm(links, W, output, "r");
			output << "    mov rbx, rax\n";
			w++;
			while (W.size() > 0)
				W.pop_back();
			while (words[w] != "=>") {
				W.push_back(words[w]);
				w++;
				if (words[w] == "\n") {
					ERROR("expected '=>'");
					return 1;
				}
			}
			math_to_asm(links, W, output, "r");
			output << "    cmp rbx, rax\n";
			if (sign == "==")
				output << "    jne .IfEnd" << ifnum << "\n";
			else if (sign == "!=")
				output << "    je .IfEnd" << ifnum << "\n";
			else if (sign == ">=")
				output << "    jl .IfEnd" << ifnum << "\n";
			else if (sign == "<=")
				output << "    jg .IfEnd" << ifnum << "\n";
			else if (sign == ">")
				output << "    jle .IfEnd" << ifnum << "\n";
			else if (sign == "<")
				output << "    jge .IfEnd" << ifnum << "\n";
			ifs.push_back(ifnum);
			ifnum++;
		}
		else if (words[w] == "while") {
			output << "\n";
			output << "    .WhileStart" << whilenum << ":\n";
			w++;
			string sign;
			vector<string> W;
			while (words[w] != "==" && words[w] != "!=" &&
				   words[w] != "<"  && words[w] != ">"  &&
				   words[w] != "<=" && words[w] != ">=") {
				W.push_back(words[w]);
				w++;
				if (words[w] == "=>" || words[w] == "\n") {
					ERROR("expected bool expresion with 'while'");
					cout << words[w] << endl;
					return 1;
				}
			}
			sign = words[w];
			math_to_asm(links, W, output, "r");
			output << "    mov rbx, rax\n";
			w++;
			while (W.size() > 0)
				W.pop_back();
			while (words[w] != "=>") {
				W.push_back(words[w]);
				w++;
				if (words[w] == "\n") {
					ERROR("expected '=>'");
					return 1;
				}
			}
			math_to_asm(links, W, output, "r");
			output << "    cmp rbx, rax\n";
			if (sign == "==")
				output << "    jne .WhileEnd" << whilenum << "\n";
			else if (sign == "!=")
				output << "    je .WhileEnd" << whilenum << "\n";
			else if (sign == ">=")
				output << "    jl .WhileEnd" << whilenum << "\n";
			else if (sign == "<=")
				output << "    jg .WhileEnd" << whilenum << "\n";
			else if (sign == ">")
				output << "    jle .WhileEnd" << whilenum << "\n";
			else if (sign == "<")
				output << "    jge .WhileEnd" << whilenum << "\n";
			whils.push_back(whilenum);
			whilenum++;
		}
		else if (words[w] == "end") {
			int scopes = 1;
			int i = w - 1;
			while (scopes != 0) {
				if (words[i] == "end")
					scopes++;
				else if (words[i] == "=>")
					scopes--;
				i--;
			}
			while (words[i] != "if" && words[i] != "else" && words[i] != "while" && words[i] != "fn") {
				if (i <= 0) {
					ERROR("extra 'end'");
					return 1;
				}
				i--;
			}
			if (words[i] == "if") {
				int num = ifs[ifs.size() - 1];
				output << "\n";
				if (words[w + 1] == "else" || words[w + 2] == "else") {
					output << "    jmp .ElseEnd" << to_string(num) << "\n";
					output << "    .IfEnd" << num << ":\n";
				}
				else {
					output << "    .IfEnd" << num << ":\n";
					ifs.pop_back();
				}
			}
			else if (words[i] == "else") {
				int num = ifs[ifs.size() - 1];
				output << "\n";
				output << "    .ElseEnd" << num << ":\n";
				ifs.pop_back();
			}
			else if (words[i] == "while") {
				int num = whils[whils.size() - 1];
				output << "\n";
				output << "    jmp .WhileStart" << num << "\n";
				output << "    .WhileEnd" << num << ":\n";
				whils.pop_back();
			}
			else if (words[i] == "fn") {
				if (words[i + 1] == "_main") {
					output << "\n";
					output << "    pop rbp\n";
					output << "    mov rax, 0x2000001\n";
					output << "    mov rdi, 0\n";
					output << "    syscall\n";
					output << "\n";
				}
				else {
					output << "    ret\n"; 
				}
			}
		}
		else if (words[w] == "fn") {
			w++;
			output << words[w] << ":\n";
			w++;
			int vars = 0;
			while (words[w] != "=>") {
				links.push_back(LINK(words[w], PTR));
				PTR += 8;
				w++;
				vars++;
			}
			int PTRbeg = PTR - 8;
			output << "    sub r11, 8\n";
			while (vars > 0) {
				output << "    mov rbx, rbp\n";
				output << "    sub rbx, r11\n";
				output << "    sub r11, 8\n";
				output << "    mov rax, QWORD [rbx]\n";
				output << "    mov QWORD [rbp - " << PTRbeg << "], rax\n";
				PTRbeg -= 8;
				vars--;
			}
			output << "    add r11, 8\n";
		}
		else if (words[w] == ".") {
			output << "\n";
			w++;
			string name = words[w];
			vector<string> W;
			int i = 0;
			if (words[w + 1] == "\n" || words[w + 1] == "->")
				w++;
			while (words[w] != "\n" && words[w] != "->") {
				w++;
				while (words[w] != "\n" && words[w] != "->" && words[w] != ",") {
					W.push_back(words[w]);
					w++;
				}
				math_to_asm(links, W, output, "r");
				output << "    mov rbx, rbp\n";
				output << "    sub rbx, r11\n";
				output << "    add r11, 8\n";
				output << "    mov QWORD [rbx], rax\n";
				while (W.size() > 0)
					W.pop_back();
				i++;
			}
			if (words[w] == "->")
				w--;
			output << "    call " << name << "\n";
		}
		else if (words[w] == "break") {
			output << "    jmp .WhileEnd" << whilenum << "\n";
		}
		else if (words[w] == "->") {
			w++;
			vector<string> W;
			while (words[w] != "\n") {
				W.push_back(words[w]);
				w++;
			}
			if (W.size() == 0) {
				ERROR("expected something after '->'");
				return 1;
			}
			output << "\n";
			output << "    mov rbx, rbp\n";
			output << "    sub rbx, r11\n";
			output << "    mov r14, QWORD [rbx]\n";
			output << "    mov " << find(links, W, output, "r") << ", r14\n";
			output << "    sub r11, 8\n";
		}
		else if (words[w] == "return") {
			w++;
			vector<string> W;
			while (words[w] != "\n") {
				W.push_back(words[w]);
				w++;
			}
			output << "\n";
			if (W.size() == 0) {
				output << "    ret\n";
			}
			else  {
				math_to_asm(links, W, output, "r");
				output << "    add r11, 8\n";
				output << "    mov rbx, rbp\n";
				output << "    sub rbx, r11\n";
				output << "    mov QWORD [rbx], rax\n";
				output << "    ret\n";
			}
		}
		else if (words[w] == "SYSCALL") {
			output << "\n";
			vector<string> W;
			string regs[] = {"r13", "rdi", "rsi", "rdx"};
			int i = 0;
			while (words[w] != "\n") {
				w++;
				while (words[w] != "\n" && words[w] != ",") {
					W.push_back(words[w]);
					w++;
				}
				math_to_asm(links, W, output, "r");
				output << "    mov " << regs[i] << ", rax\n";
				while (W.size() > 0)
					W.pop_back();
				i++;
			}
			output << "    mov rax, r13\n";
			output << "    add rax, 33554432\n";
			output << "    syscall\n";
		}
	}
	output << "\n";
	output << AfterWords << "\n";
	cout << "==";
	// END

	output.close();
	cout << "=>" << endl << "\x1b[32mFinish\x1b[30m" << endl;
	return 0;
}