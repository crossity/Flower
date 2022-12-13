fn _main =>
	int[100] screen
	.ClearScreen
	.I 1, 2, 3, 4
	.II 1
	print endl
	//print int screen[59]
	.ShowScreen
end

fn I a b c d =>
	print int a int b int c int d
end

fn II e =>
	print int e
end

fn ShowScreen =>
	int x = 0
	int y = 0
	while y < 10 =>
		while x < 10 =>
			print int screen[y * 10 + x] " "
			x += 1
		end
		print endl
		y += 1
		x = 0
	end
end

fn ClearScreen =>
	int i = 0
	while i < 100 =>
		screen[i] = i
		i += 1
	end
end