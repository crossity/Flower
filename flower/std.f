fn SyscallWrite ~MSGLINK SIZE FD =>
	char[32] BUF = 0
	int I = 0
	while I < SIZE =>
		BUF[31 - I] = #~MSGLINK
		I += 1
		~MSGLINK -= 8
	end
	SYSCALL 4, FD, $BUF[31], SIZE * 8
end