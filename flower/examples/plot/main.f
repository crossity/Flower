import "libs/std.f"

const string input "./input.txt" 0 end

fn _main =>
	// SETTING
	char[100] SCREEN = '.'
	int Height = 10
	int Width = 10

	int[30] points = 0
	int points`size = 0

	// OPENNING INPUT FILE
	int fd
	int open
	.open input, 0 -> fd
	.is_open fd -> open
	if open == 0 =>
		print "No Input File" endl
		.exit 1
	end

	// CONVERTING
	char ch = 1
	char[3] buf
	char buf`size = 0
	int mom = 0
	int points`el
	while ch != 0 =>
		.getchar fd -> ch
		
		if ch != ' ' => if ch != 10 =>
			buf`size += 1
			buf[buf`size - 1] = ch
		end end
		else =>
			.stoi $buf, buf`size -> points`el
			points[points`size - 1] = points`el
			points`size += 1
			buf`size = 0
		end
		if ch == 10 =>
			.stoi $buf, buf`size -> points`el
			points[points`size - 1] = points`el			points`size += 1
			buf`size = 0
		end
	end
	print endl

	// DRAWING
	.ShowScreen
	print int Width endl
end

fn ShowScreen =>
	int x = 0
	int y = 0
	while y < Height =>
		while x < 10 =>
			print char SCREEN[y * Width + x]
			x += 1
		end
		x = 0
		print endl
		y += 1
	end
end