global _main

NEGATIVEMESSEGE: db "-"
ZEROMESSEGE: db "0"

_main:
    push rbp
    mov rbp, rsp
    mov r11, 16
    mov QWORD [rbp - 996], 0
    mov QWORD [rbp - 1004], 0
    mov QWORD [rbp - 1012], 0
    mov QWORD [rbp - 1020], 0
    mov QWORD [rbp - 1028], 0
    mov QWORD [rbp - 1036], 0
    mov QWORD [rbp - 1044], 0
    mov QWORD [rbp - 1052], 0
    mov QWORD [rbp - 1060], 0
    mov QWORD [rbp - 1068], 0
    mov QWORD [rbp - 1076], 0
    mov QWORD [rbp - 1084], 0
    mov QWORD [rbp - 1092], 0
    mov QWORD [rbp - 1100], 0
    mov QWORD [rbp - 1108], 0
    mov QWORD [rbp - 1116], 0
    mov QWORD [rbp - 1124], 0
    mov QWORD [rbp - 1132], 0
    mov QWORD [rbp - 1140], 0
    mov QWORD [rbp - 1148], 0
    mov QWORD [rbp - 1156], 0
    mov QWORD [rbp - 1164], 0
    mov QWORD [rbp - 1172], 0
    mov QWORD [rbp - 1180], 0
    mov QWORD [rbp - 1188], 0
    mov QWORD [rbp - 1196], 0
    mov QWORD [rbp - 1204], 0
    mov QWORD [rbp - 1212], 0
    mov QWORD [rbp - 1220], 0
    mov QWORD [rbp - 1228], 0
    mov QWORD [rbp - 1236], 0
    mov QWORD [rbp - 1244], 0
    mov QWORD [rbp - 1252], 0
    mov QWORD [rbp - 1260], 0
    mov QWORD [rbp - 1268], 0
    mov QWORD [rbp - 1276], 0
    mov QWORD [rbp - 1284], 0
    mov QWORD [rbp - 1292], 0
    mov QWORD [rbp - 1300], 0
    mov QWORD [rbp - 1308], 0
    mov QWORD [rbp - 1316], 0
    mov QWORD [rbp - 1324], 0
    mov QWORD [rbp - 1332], 0
    mov QWORD [rbp - 1340], 0
    mov QWORD [rbp - 1348], 0
    mov QWORD [rbp - 1356], 0
    mov QWORD [rbp - 1364], 0
    mov QWORD [rbp - 1372], 0
    mov QWORD [rbp - 1380], 0
    mov QWORD [rbp - 1388], 0
    mov QWORD [rbp - 1396], 0
    mov QWORD [rbp - 1404], 0
    mov QWORD [rbp - 1412], 0
    mov QWORD [rbp - 1420], 0
    mov QWORD [rbp - 1428], 0
    mov QWORD [rbp - 1436], 0
    mov QWORD [rbp - 1444], 0
    mov QWORD [rbp - 1452], 0
    mov QWORD [rbp - 1460], 0
    mov QWORD [rbp - 1468], 0
    mov QWORD [rbp - 1476], 0
    mov QWORD [rbp - 1484], 0
    mov QWORD [rbp - 1492], 0
    mov QWORD [rbp - 1500], 0
    mov QWORD [rbp - 1508], 0
    mov QWORD [rbp - 1516], 0
    mov QWORD [rbp - 1524], 0
    mov QWORD [rbp - 1532], 0
    mov QWORD [rbp - 1540], 0
    mov QWORD [rbp - 1548], 0
    mov QWORD [rbp - 1556], 0
    mov QWORD [rbp - 1564], 0
    mov QWORD [rbp - 1572], 0
    mov QWORD [rbp - 1580], 0
    mov QWORD [rbp - 1588], 0
    mov QWORD [rbp - 1596], 0
    mov QWORD [rbp - 1604], 0
    mov QWORD [rbp - 1612], 0
    mov QWORD [rbp - 1620], 0
    mov QWORD [rbp - 1628], 0
    mov QWORD [rbp - 1636], 0
    mov QWORD [rbp - 1644], 0
    mov QWORD [rbp - 1652], 0
    mov QWORD [rbp - 1660], 0
    mov QWORD [rbp - 1668], 0
    mov QWORD [rbp - 1676], 0
    mov QWORD [rbp - 1684], 0
    mov QWORD [rbp - 1692], 0
    mov QWORD [rbp - 1700], 0
    mov QWORD [rbp - 1708], 0
    mov QWORD [rbp - 1716], 0
    mov QWORD [rbp - 1724], 0
    mov QWORD [rbp - 1732], 0
    mov QWORD [rbp - 1740], 0
    mov QWORD [rbp - 1748], 0
    mov QWORD [rbp - 1756], 0
    mov QWORD [rbp - 1764], 0
    mov QWORD [rbp - 1772], 0
    mov QWORD [rbp - 1780], 0
    mov QWORD [rbp - 1788], 0

    call ClearScreen

    mov rax, 1
    mov rbx, rbp
    sub rbx, r11
    add r11, 8
    mov QWORD [rbx], rax
    mov rax, 2
    mov rbx, rbp
    sub rbx, r11
    add r11, 8
    mov QWORD [rbx], rax
    mov rax, 3
    mov rbx, rbp
    sub rbx, r11
    add r11, 8
    mov QWORD [rbx], rax
    mov rax, 4
    mov rbx, rbp
    sub rbx, r11
    add r11, 8
    mov QWORD [rbx], rax
    call I

    mov rax, 1
    mov rbx, rbp
    sub rbx, r11
    add r11, 8
    mov QWORD [rbx], rax
    call II

    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, msg1
    mov rdx, 1
    syscall

    call ShowScreen

    pop rbp
    mov rax, 0x2000001
    mov rdi, 0
    syscall

I:
    sub r11, 8
    mov rbx, rbp
    sub rbx, r11
    sub r11, 8
    mov rax, QWORD [rbx]
    mov QWORD [rbp - 1820], rax
    mov rbx, rbp
    sub rbx, r11
    sub r11, 8
    mov rax, QWORD [rbx]
    mov QWORD [rbp - 1812], rax
    mov rbx, rbp
    sub rbx, r11
    sub r11, 8
    mov rax, QWORD [rbx]
    mov QWORD [rbp - 1804], rax
    mov rbx, rbp
    sub rbx, r11
    sub r11, 8
    mov rax, QWORD [rbx]
    mov QWORD [rbp - 1796], rax
    add r11, 8

    mov rax, QWORD [rbp - 1796]
    xor rcx, rcx
    mov r14, 4
    mov r13, rax
    cmp r13, 0
    jge .NEGATIVECHECKEND2
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, NEGATIVEMESSEGE
    mov rdx, 1
    syscall
    imul r13, r13, -1
    .NEGATIVECHECKEND2:
    cmp r13, 0
    jne .ZEROCHECKEND2
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, ZEROMESSEGE
    mov rdx, 1
    syscall
    .ZEROCHECKEND2:
    .PRINT2:
    cmp r13, 0
    jle .L2
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
    jmp .PRINT2
    .L2:
    sub r14, 8
    .Convert2:
    cmp r14, 0
    jl .END2
    mov r10, rbp
    add r10, r14
    sub r14, 8
    mov rdx, r10
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, rdx
    mov rdx, 1
    syscall
    jmp .Convert2
    .END2:

    mov rax, QWORD [rbp - 1804]
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

    mov rax, QWORD [rbp - 1812]
    xor rcx, rcx
    mov r14, 4
    mov r13, rax
    cmp r13, 0
    jge .NEGATIVECHECKEND4
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, NEGATIVEMESSEGE
    mov rdx, 1
    syscall
    imul r13, r13, -1
    .NEGATIVECHECKEND4:
    cmp r13, 0
    jne .ZEROCHECKEND4
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, ZEROMESSEGE
    mov rdx, 1
    syscall
    .ZEROCHECKEND4:
    .PRINT4:
    cmp r13, 0
    jle .L4
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
    jmp .PRINT4
    .L4:
    sub r14, 8
    .Convert4:
    cmp r14, 0
    jl .END4
    mov r10, rbp
    add r10, r14
    sub r14, 8
    mov rdx, r10
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, rdx
    mov rdx, 1
    syscall
    jmp .Convert4
    .END4:

    mov rax, QWORD [rbp - 1820]
    xor rcx, rcx
    mov r14, 4
    mov r13, rax
    cmp r13, 0
    jge .NEGATIVECHECKEND5
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, NEGATIVEMESSEGE
    mov rdx, 1
    syscall
    imul r13, r13, -1
    .NEGATIVECHECKEND5:
    cmp r13, 0
    jne .ZEROCHECKEND5
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, ZEROMESSEGE
    mov rdx, 1
    syscall
    .ZEROCHECKEND5:
    .PRINT5:
    cmp r13, 0
    jle .L5
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
    jmp .PRINT5
    .L5:
    sub r14, 8
    .Convert5:
    cmp r14, 0
    jl .END5
    mov r10, rbp
    add r10, r14
    sub r14, 8
    mov rdx, r10
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, rdx
    mov rdx, 1
    syscall
    jmp .Convert5
    .END5:
    ret
II:
    sub r11, 8
    mov rbx, rbp
    sub rbx, r11
    sub r11, 8
    mov rax, QWORD [rbx]
    mov QWORD [rbp - 1828], rax
    add r11, 8

    mov rax, QWORD [rbp - 1828]
    xor rcx, rcx
    mov r14, 4
    mov r13, rax
    cmp r13, 0
    jge .NEGATIVECHECKEND6
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, NEGATIVEMESSEGE
    mov rdx, 1
    syscall
    imul r13, r13, -1
    .NEGATIVECHECKEND6:
    cmp r13, 0
    jne .ZEROCHECKEND6
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, ZEROMESSEGE
    mov rdx, 1
    syscall
    .ZEROCHECKEND6:
    .PRINT6:
    cmp r13, 0
    jle .L6
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
    jmp .PRINT6
    .L6:
    sub r14, 8
    .Convert6:
    cmp r14, 0
    jl .END6
    mov r10, rbp
    add r10, r14
    sub r14, 8
    mov rdx, r10
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, rdx
    mov rdx, 1
    syscall
    jmp .Convert6
    .END6:
    ret
ShowScreen:
    sub r11, 8
    add r11, 8

    mov rax, 0
    mov QWORD [rbp - 1836], rax

    mov rax, 0
    mov QWORD [rbp - 1844], rax

    .WhileStart1:
    mov rax, QWORD [rbp - 1844]
    mov rbx, rax
    mov rax, 10
    cmp rbx, rax
    jge .WhileEnd1

    .WhileStart2:
    mov rax, QWORD [rbp - 1836]
    mov rbx, rax
    mov rax, 10
    cmp rbx, rax
    jge .WhileEnd2

    mov rax, QWORD [rbp - 1844]
    mov rbx, 10
    imul rbx
    add rax, QWORD [rbp - 1836]
    imul rax, rax, 8
    add rax, 996
    lea rbx, [rbp]
    sub rbx, rax
    mov rax, QWORD [rbx]
    xor rcx, rcx
    mov r14, 4
    mov r13, rax
    cmp r13, 0
    jge .NEGATIVECHECKEND7
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, NEGATIVEMESSEGE
    mov rdx, 1
    syscall
    imul r13, r13, -1
    .NEGATIVECHECKEND7:
    cmp r13, 0
    jne .ZEROCHECKEND7
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, ZEROMESSEGE
    mov rdx, 1
    syscall
    .ZEROCHECKEND7:
    .PRINT7:
    cmp r13, 0
    jle .L7
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
    jmp .PRINT7
    .L7:
    sub r14, 8
    .Convert7:
    cmp r14, 0
    jl .END7
    mov r10, rbp
    add r10, r14
    sub r14, 8
    mov rdx, r10
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, rdx
    mov rdx, 1
    syscall
    jmp .Convert7
    .END7:

    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, msg8
    mov rdx, 1
    syscall

    mov rax, 1
    add QWORD [rbp - 1836], rax

    jmp .WhileStart2
    .WhileEnd2:

    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, msg9
    mov rdx, 1
    syscall

    mov rax, 1
    add QWORD [rbp - 1844], rax

    mov rax, 0
    mov QWORD [rbp - 1836], rax

    jmp .WhileStart1
    .WhileEnd1:
    ret
ClearScreen:
    sub r11, 8
    add r11, 8

    mov rax, 0
    mov QWORD [rbp - 1852], rax

    .WhileStart3:
    mov rax, QWORD [rbp - 1852]
    mov rbx, rax
    mov rax, 100
    cmp rbx, rax
    jge .WhileEnd3

    mov rax, QWORD [rbp - 1852]
    imul rax, rax, 8
    add rax, 996
    lea rbx, [rbp]
    sub rbx, rax
    mov rax, QWORD [rbp - 1852]
    mov QWORD [rbx], rax

    mov rax, 1
    add QWORD [rbp - 1852], rax

    jmp .WhileStart3
    .WhileEnd3:
    ret

msg1: db 10
msg8: db " "
msg9: db 10

