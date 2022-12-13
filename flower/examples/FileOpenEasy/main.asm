global _main

NEGATIVEMESSEGE: db "-"
ZEROMESSEGE: db "0"
path2: db "main.f", 0
path2Size: equ $ - path2

_main:
    push rbp
    mov rbp, rsp
    mov r11, 16

    mov rax, 0
    mov QWORD [rbp - 208], rax

    mov rax, 0
    mov QWORD [rbp - 216], rax

    mov rax, path2
    mov rbx, rbp
    sub rbx, r11
    add r11, 8
    mov QWORD [rbx], rax
    mov rax, 0
    mov rbx, rbp
    sub rbx, r11
    add r11, 8
    mov QWORD [rbx], rax
    call open

    mov rbx, rbp
    sub rbx, r11
    mov r14, QWORD [rbx]
    mov QWORD [rbp - 208], r14
    sub r11, 8

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

    mov rax, QWORD [rbp - 208]
    mov rbx, rbp
    sub rbx, r11
    add r11, 8
    mov QWORD [rbx], rax
    call is_open

    mov rbx, rbp
    sub rbx, r11
    mov r14, QWORD [rbx]
    mov QWORD [rbp - 216], r14
    sub r11, 8

    mov rax, QWORD [rbp - 216]
    mov rbx, rax
    mov rax, 0
    cmp rbx, rax
    jne .IfEnd1

    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, msg3
    mov rdx, 13
    syscall

    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, path2
    mov rdx, path2Size
    syscall

    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, msg4
    mov rdx, 1
    syscall

    mov rax, 1
    mov rbx, rbp
    sub rbx, r11
    add r11, 8
    mov QWORD [rbx], rax
    call exit

    .IfEnd1:

    mov rax, 1
    mov QWORD [rbp - 224], rax

    .WhileStart1:
    mov rax, QWORD [rbp - 224]
    mov rbx, rax
    mov rax, 0
    cmp rbx, rax
    je .WhileEnd1

    mov rax, QWORD [rbp - 208]
    mov rbx, rbp
    sub rbx, r11
    add r11, 8
    mov QWORD [rbx], rax
    call getchar

    mov rbx, rbp
    sub rbx, r11
    mov r14, QWORD [rbx]
    mov QWORD [rbp - 224], r14
    sub r11, 8

    mov rax, QWORD [rbp - 224]
    mov BYTE [rbp + 8], al
    mov rdx, rbp
    add rdx, 8
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, rdx
    mov rdx, 1
    syscall

    jmp .WhileStart1
    .WhileEnd1:

    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, msg5
    mov rdx, 1
    syscall

    pop rbp
    mov rax, 0x2000001
    mov rdi, 0
    syscall

exit:
    sub r11, 8
    mov rbx, rbp
    sub rbx, r11
    sub r11, 8
    mov rax, QWORD [rbx]
    mov QWORD [rbp - 232], rax
    add r11, 8

    mov rax, 1
    mov r13, rax
    mov rax, 1
    mov rdi, rax
    mov rax, r13
    add rax, 33554432
    syscall
    ret
write:
    sub r11, 8
    mov rbx, rbp
    sub rbx, r11
    sub r11, 8
    mov rax, QWORD [rbx]
    mov QWORD [rbp - 256], rax
    mov rbx, rbp
    sub rbx, r11
    sub r11, 8
    mov rax, QWORD [rbx]
    mov QWORD [rbp - 248], rax
    mov rbx, rbp
    sub rbx, r11
    sub r11, 8
    mov rax, QWORD [rbx]
    mov QWORD [rbp - 240], rax
    add r11, 8

    mov rax, 0
    mov QWORD [rbp - 264], rax
    mov QWORD [rbp - 272], rax
    mov QWORD [rbp - 280], rax
    mov QWORD [rbp - 288], rax
    mov QWORD [rbp - 296], rax
    mov QWORD [rbp - 304], rax
    mov QWORD [rbp - 312], rax
    mov QWORD [rbp - 320], rax
    mov QWORD [rbp - 328], rax
    mov QWORD [rbp - 336], rax
    mov QWORD [rbp - 344], rax
    mov QWORD [rbp - 352], rax
    mov QWORD [rbp - 360], rax
    mov QWORD [rbp - 368], rax
    mov QWORD [rbp - 376], rax
    mov QWORD [rbp - 384], rax
    mov QWORD [rbp - 392], rax
    mov QWORD [rbp - 400], rax
    mov QWORD [rbp - 408], rax
    mov QWORD [rbp - 416], rax
    mov QWORD [rbp - 424], rax
    mov QWORD [rbp - 432], rax
    mov QWORD [rbp - 440], rax
    mov QWORD [rbp - 448], rax
    mov QWORD [rbp - 456], rax
    mov QWORD [rbp - 464], rax
    mov QWORD [rbp - 472], rax
    mov QWORD [rbp - 480], rax
    mov QWORD [rbp - 488], rax
    mov QWORD [rbp - 496], rax
    mov QWORD [rbp - 504], rax
    mov QWORD [rbp - 512], rax

    mov rax, 0
    mov QWORD [rbp - 520], rax

    .WhileStart2:
    mov rax, QWORD [rbp - 520]
    mov rbx, rax
    mov rax, QWORD [rbp - 248]
    cmp rbx, rax
    jge .WhileEnd2

    mov rax, 31
    sub rax, QWORD [rbp - 520]
    imul rax, rax, 8
    add rax, 264
    lea rbx, [rbp]
    sub rbx, rax
    mov r13, QWORD [rbp - 240]
    mov rax, QWORD [r13]
    mov QWORD [rbx], rax

    mov rax, 1
    add QWORD [rbp - 520], rax

    mov rax, 8
    sub QWORD [rbp - 240], rax

    jmp .WhileStart2
    .WhileEnd2:

    mov rax, 4
    mov r13, rax
    mov rax, QWORD [rbp - 256]
    mov rdi, rax
    mov rax, 31
    imul rax, rax, 8
    add rax, 264
    lea rbx, [rbp]
    sub rbx, rax
    mov rax, rbx
    mov rsi, rax
    mov rax, QWORD [rbp - 248]
    mov rbx, 8
    imul rbx
    mov rdx, rax
    mov rax, r13
    add rax, 33554432
    syscall
    ret
getchar:
    sub r11, 8
    mov rbx, rbp
    sub rbx, r11
    sub r11, 8
    mov rax, QWORD [rbx]
    mov QWORD [rbp - 528], rax
    add r11, 8
    mov QWORD [rbp - 536], 0

    mov rax, 3
    mov r13, rax
    mov rax, QWORD [rbp - 528]
    mov rdi, rax
    mov r12, rbp
    sub r12, 536
    mov rax, r12
    mov rsi, rax
    mov rax, 1
    mov rdx, rax
    mov rax, r13
    add rax, 33554432
    syscall

    mov rax, QWORD [rbp - 536]
    add r11, 8
    mov rbx, rbp
    sub rbx, r11
    mov QWORD [rbx], rax
    ret
    ret
is_open:
    sub r11, 8
    mov rbx, rbp
    sub rbx, r11
    sub r11, 8
    mov rax, QWORD [rbx]
    mov QWORD [rbp - 544], rax
    add r11, 8

    mov rax, QWORD [rbp - 544]
    mov rbx, rax
    mov rax, 2
    cmp rbx, rax
    jne .IfEnd2

    mov rax, 0
    add r11, 8
    mov rbx, rbp
    sub rbx, r11
    mov QWORD [rbx], rax
    ret

    .IfEnd2:

    mov rax, 1
    add r11, 8
    mov rbx, rbp
    sub rbx, r11
    mov QWORD [rbx], rax
    ret
    ret
open:
    sub r11, 8
    mov rbx, rbp
    sub rbx, r11
    sub r11, 8
    mov rax, QWORD [rbx]
    mov QWORD [rbp - 560], rax
    mov rbx, rbp
    sub rbx, r11
    sub r11, 8
    mov rax, QWORD [rbx]
    mov QWORD [rbp - 552], rax
    add r11, 8

    mov rax, 5
    mov r13, rax
    mov rax, QWORD [rbp - 552]
    mov rdi, rax
    mov rax, QWORD [rbp - 560]
    mov rsi, rax
    mov rax, r13
    add rax, 33554432
    syscall

    mov rax, rax
    add r11, 8
    mov rbx, rbp
    sub rbx, r11
    mov QWORD [rbx], rax
    ret
    ret
to_string:
    sub r11, 8
    mov rbx, rbp
    sub rbx, r11
    sub r11, 8
    mov rax, QWORD [rbx]
    mov QWORD [rbp - 576], rax
    mov rbx, rbp
    sub rbx, r11
    sub r11, 8
    mov rax, QWORD [rbx]
    mov QWORD [rbp - 568], rax
    add r11, 8

    mov rax, 0
    mov QWORD [rbp - 584], rax

    .WhileStart3:
    mov r13, QWORD [rbp - 568]
    mov rax, QWORD [r13]
    mov rbx, rax
    mov rax, 0
    cmp rbx, rax
    je .WhileEnd3
    mov rax, QWORD [rbp - 576]
    add rax, QWORD [rbp - 584]
    mov rbx, rax
    mov r13, QWORD [rbp - 568]
    mov rax, QWORD [r13]
    mov BYTE [rbx], al

    mov rax, 8
    sub QWORD [rbp - 568], rax

    mov rax, 1
    add QWORD [rbp - 584], rax

    jmp .WhileStart3
    .WhileEnd3:
    ret

msg2: db 10
msg3: db "No such file "
msg4: db 10
msg5: db 10

