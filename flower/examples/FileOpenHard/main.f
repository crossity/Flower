import "libs/std.f"
                
const string path2 "./main.f" 0 end
           
fn _main =>
	char[9] path = "./main.f!"
	path[8] = 0
	char[2] str

	int ~path = $path
	int ~str = $str[1]

	.to_string ~path, ~str

    int fd = 0 
    int open = 0
        
    .open ~str, 0 -> fd
    .is_open fd -> open  
    if open == false =>
        print "No such file " string path2 endl
        .exit 1
    end

    char ch = 1

    while ch != 0 =>
        .getchar fd -> ch
        print char ch     
    end
                
    print endl
end