fn exit CODE =>
	SYSCALL 1, 1
end

fn write ~MSGLINK SIZE FD =>
	char[32] BUF = 0
	int I = 0
	while I < SIZE =>
		BUF[31 - I] = #~MSGLINK
		I += 1
		~MSGLINK -= 8
	end
	SYSCALL 4, FD, $BUF[31], SIZE * 8
end

fn getchar FD =>
	char chr
	SYSCALL 3, FD, $chr, 1
	return chr
end

fn open ~FILEDIR MODE =>
	SYSCALL 5, ~FILEDIR, MODE
	return rax
end

fn close FD =>
	SYSCALL 6, FD
end

fn is_open FD =>
	if FD == 2 =>
		return false
	end
	return true
end

fn to_string ~POINT_TO_ARRAY ~POINT_TO_END_OF_STRING =>
	int i = 0
	while #~POINT_TO_ARRAY != 0 =>
		mem ~POINT_TO_END_OF_STRING + i, #~POINT_TO_ARRAY
		~POINT_TO_ARRAY -= 8
		i += 1
 	end
end

fn stoi ~STRING SIZE =>
	int i = SIZE - 1
	int output = 0
	int mul = 1
	char ch
	while i >= 0 =>
		ch = i * 8
		ch = ~STRING - ch
		ch = #ch
		ch -= 48
		ch *= mul
		output += ch
		mul *= 10
		i -= 1
	end
	return output 
end