fn _main =>
	int a = 0
	int b = 0
	while a < 10 =>
		print int a endl
		while b < 10 =>
			print int b
			b += 1
		end
		print endl
		b = 0
		a += 1
	end
end