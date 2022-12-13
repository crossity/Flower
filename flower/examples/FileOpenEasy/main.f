import "libs/std.f"

const string path2 "main.f" 0 end

fn _main =>
	int fd = 0
	int open = 0

	.open path2, 0 -> fd

	print int fd endl
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