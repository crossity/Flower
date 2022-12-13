import "std.f"

const int fd 1

fn _main =>
	char[13] msg = "Hello, World!"
	int size = 13
	.write $msg[0], size, fd
end
