global _main

NEGATIVEMESSEGE: db "-"
ZEROMESSEGE: db "0"

_main:
    push rbp
    mov rbp, rsp
    mov r11, 16

    mov rax, 0
    mov QWORD [rbp - 208], rax

    mov rax, 0
    mov QWORD [rbp - 216], rax

    .WhileStart1:
    mov rax, QWORD [rbp - 208]
    mov rbx, rax
    mov rax, 10
    cmp rbx, rax
    jge .WhileEnd1

    mov rax, QWORD [rbp - 208]
    xor rcx, rcx
    mov r14, 4
    mov r13, rax
    cmp r13, 0
    jge .NEGATIVECHECKEND1
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, NEGATIVEMESSEGE
    mov rdx, 1
    syscall
    imul r13, r13, -1
    .NEGATIVECHECKEND1:
    cmp r13, 0
    jne .ZEROCHECKEND1
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, ZEROMESSEGE
    mov rdx, 1
    syscall
    .ZEROCHECKEND1:
    .PRINT1:
    cmp r13, 0
    jle .L1
    mov rax, r13
    xor rdx, rdx
    mov rbx, 10
    div rbx
    mov r13, rax
    add rdx, 48
    mov r10, rbp
    add r10, r14
    add r14, 8
    mov QWORD [r10], rdx
    jmp .PRINT1
    .L1:
    sub r14, 8
    .Convert1:
    cmp r14, 0
    jl .END1
    mov r10, rbp
    add r10, r14
    sub r14, 8
    mov rdx, r10
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, rdx
    mov rdx, 1
    syscall
    jmp .Convert1
    .END1:

    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, msg2
    mov rdx, 1
    syscall

    .WhileStart2:
    mov rax, QWORD [rbp - 216]
    mov rbx, rax
    mov rax, 10
    cmp rbx, rax
    jge .WhileEnd2

    mov rax, QWORD [rbp - 216]
    xor rcx, rcx
    mov r14, 4
    mov r13, rax
    cmp r13, 0
    jge .NEGATIVECHECKEND3
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, NEGATIVEMESSEGE
    mov rdx, 1
    syscall
    imul r13, r13, -1
    .NEGATIVECHECKEND3:
    cmp r13, 0
    jne .ZEROCHECKEND3
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, ZEROMESSEGE
    mov rdx, 1
    syscall
    .ZEROCHECKEND3:
    .PRINT3:
    cmp r13, 0
    jle .L3
    mov rax, r13
    xor rdx, rdx
    mov rbx, 10
    div rbx
    mov r13, rax
    add rdx, 48
    mov r10, rbp
    add r10, r14
    add r14, 8
    mov QWORD [r10], rdx
    jmp .PRINT3
    .L3:
    sub r14, 8
    .Convert3:
    cmp r14, 0
    jl .END3
    mov r10, rbp
    add r10, r14
    sub r14, 8
    mov rdx, r10
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, rdx
    mov rdx, 1
    syscall
    jmp .Convert3
    .END3:

    mov rax, 1
    add QWORD [rbp - 216], rax

    jmp .WhileStart2
    .WhileEnd2:

    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, msg4
    mov rdx, 1
    syscall

    mov rax, 0
    mov QWORD [rbp - 216], rax

    mov rax, 1
    add QWORD [rbp - 208], rax

    jmp .WhileStart1
    .WhileEnd1:

    pop rbp
    mov rax, 0x2000001
    mov rdi, 0
    syscall


msg2: db 10
msg4: db 10

