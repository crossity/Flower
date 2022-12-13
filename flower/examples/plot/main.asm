global _main

NEGATIVEMESSEGE: db "-"
ZEROMESSEGE: db "0"
input: db "./input.txt", 0
inputSize: equ $ - input

_main:
    push rbp
    mov rbp, rsp
    mov r11, 16

    mov rax, 46
    mov QWORD [rbp - 996], rax
    mov QWORD [rbp - 1004], rax
    mov QWORD [rbp - 1012], rax
    mov QWORD [rbp - 1020], rax
    mov QWORD [rbp - 1028], rax
    mov QWORD [rbp - 1036], rax
    mov QWORD [rbp - 1044], rax
    mov QWORD [rbp - 1052], rax
    mov QWORD [rbp - 1060], rax
    mov QWORD [rbp - 1068], rax
    mov QWORD [rbp - 1076], rax
    mov QWORD [rbp - 1084], rax
    mov QWORD [rbp - 1092], rax
    mov QWORD [rbp - 1100], rax
    mov QWORD [rbp - 1108], rax
    mov QWORD [rbp - 1116], rax
    mov QWORD [rbp - 1124], rax
    mov QWORD [rbp - 1132], rax
    mov QWORD [rbp - 1140], rax
    mov QWORD [rbp - 1148], rax
    mov QWORD [rbp - 1156], rax
    mov QWORD [rbp - 1164], rax
    mov QWORD [rbp - 1172], rax
    mov QWORD [rbp - 1180], rax
    mov QWORD [rbp - 1188], rax
    mov QWORD [rbp - 1196], rax
    mov QWORD [rbp - 1204], rax
    mov QWORD [rbp - 1212], rax
    mov QWORD [rbp - 1220], rax
    mov QWORD [rbp - 1228], rax
    mov QWORD [rbp - 1236], rax
    mov QWORD [rbp - 1244], rax
    mov QWORD [rbp - 1252], rax
    mov QWORD [rbp - 1260], rax
    mov QWORD [rbp - 1268], rax
    mov QWORD [rbp - 1276], rax
    mov QWORD [rbp - 1284], rax
    mov QWORD [rbp - 1292], rax
    mov QWORD [rbp - 1300], rax
    mov QWORD [rbp - 1308], rax
    mov QWORD [rbp - 1316], rax
    mov QWORD [rbp - 1324], rax
    mov QWORD [rbp - 1332], rax
    mov QWORD [rbp - 1340], rax
    mov QWORD [rbp - 1348], rax
    mov QWORD [rbp - 1356], rax
    mov QWORD [rbp - 1364], rax
    mov QWORD [rbp - 1372], rax
    mov QWORD [rbp - 1380], rax
    mov QWORD [rbp - 1388], rax
    mov QWORD [rbp - 1396], rax
    mov QWORD [rbp - 1404], rax
    mov QWORD [rbp - 1412], rax
    mov QWORD [rbp - 1420], rax
    mov QWORD [rbp - 1428], rax
    mov QWORD [rbp - 1436], rax
    mov QWORD [rbp - 1444], rax
    mov QWORD [rbp - 1452], rax
    mov QWORD [rbp - 1460], rax
    mov QWORD [rbp - 1468], rax
    mov QWORD [rbp - 1476], rax
    mov QWORD [rbp - 1484], rax
    mov QWORD [rbp - 1492], rax
    mov QWORD [rbp - 1500], rax
    mov QWORD [rbp - 1508], rax
    mov QWORD [rbp - 1516], rax
    mov QWORD [rbp - 1524], rax
    mov QWORD [rbp - 1532], rax
    mov QWORD [rbp - 1540], rax
    mov QWORD [rbp - 1548], rax
    mov QWORD [rbp - 1556], rax
    mov QWORD [rbp - 1564], rax
    mov QWORD [rbp - 1572], rax
    mov QWORD [rbp - 1580], rax
    mov QWORD [rbp - 1588], rax
    mov QWORD [rbp - 1596], rax
    mov QWORD [rbp - 1604], rax
    mov QWORD [rbp - 1612], rax
    mov QWORD [rbp - 1620], rax
    mov QWORD [rbp - 1628], rax
    mov QWORD [rbp - 1636], rax
    mov QWORD [rbp - 1644], rax
    mov QWORD [rbp - 1652], rax
    mov QWORD [rbp - 1660], rax
    mov QWORD [rbp - 1668], rax
    mov QWORD [rbp - 1676], rax
    mov QWORD [rbp - 1684], rax
    mov QWORD [rbp - 1692], rax
    mov QWORD [rbp - 1700], rax
    mov QWORD [rbp - 1708], rax
    mov QWORD [rbp - 1716], rax
    mov QWORD [rbp - 1724], rax
    mov QWORD [rbp - 1732], rax
    mov QWORD [rbp - 1740], rax
    mov QWORD [rbp - 1748], rax
    mov QWORD [rbp - 1756], rax
    mov QWORD [rbp - 1764], rax
    mov QWORD [rbp - 1772], rax
    mov QWORD [rbp - 1780], rax
    mov QWORD [rbp - 1788], rax

    mov rax, 10
    mov QWORD [rbp - 1796], rax

    mov rax, 10
    mov QWORD [rbp - 1804], rax

    mov rax, 0
    mov QWORD [rbp - 1812], rax
    mov QWORD [rbp - 1820], rax
    mov QWORD [rbp - 1828], rax
    mov QWORD [rbp - 1836], rax
    mov QWORD [rbp - 1844], rax
    mov QWORD [rbp - 1852], rax
    mov QWORD [rbp - 1860], rax
    mov QWORD [rbp - 1868], rax
    mov QWORD [rbp - 1876], rax
    mov QWORD [rbp - 1884], rax
    mov QWORD [rbp - 1892], rax
    mov QWORD [rbp - 1900], rax
    mov QWORD [rbp - 1908], rax
    mov QWORD [rbp - 1916], rax
    mov QWORD [rbp - 1924], rax
    mov QWORD [rbp - 1932], rax
    mov QWORD [rbp - 1940], rax
    mov QWORD [rbp - 1948], rax
    mov QWORD [rbp - 1956], rax
    mov QWORD [rbp - 1964], rax
    mov QWORD [rbp - 1972], rax
    mov QWORD [rbp - 1980], rax
    mov QWORD [rbp - 1988], rax
    mov QWORD [rbp - 1996], rax
    mov QWORD [rbp - 2004], rax
    mov QWORD [rbp - 2012], rax
    mov QWORD [rbp - 2020], rax
    mov QWORD [rbp - 2028], rax
    mov QWORD [rbp - 2036], rax
    mov QWORD [rbp - 2044], rax

    mov rax, 0
    mov QWORD [rbp - 2052], rax
    mov QWORD [rbp - 2060], 0
    mov QWORD [rbp - 2068], 0

    mov rax, input
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
    mov QWORD [rbp - 2060], r14
    sub r11, 8

    mov rax, QWORD [rbp - 2060]
    mov rbx, rbp
    sub rbx, r11
    add r11, 8
    mov QWORD [rbx], rax
    call is_open

    mov rbx, rbp
    sub rbx, r11
    mov r14, QWORD [rbx]
    mov QWORD [rbp - 2068], r14
    sub r11, 8

    mov rax, QWORD [rbp - 2068]
    mov rbx, rax
    mov rax, 0
    cmp rbx, rax
    jne .IfEnd1

    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, msg1
    mov rdx, 13
    syscall

    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, msg2
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
    mov QWORD [rbp - 2076], rax
    mov QWORD [rbp - 2084], 0
    mov QWORD [rbp - 2092], 0
    mov QWORD [rbp - 2100], 0

    mov rax, 0
    mov QWORD [rbp - 2108], rax

    mov rax, 0
    mov QWORD [rbp - 2116], rax
    mov QWORD [rbp - 2124], 0

    .WhileStart1:
    mov rax, QWORD [rbp - 2076]
    mov rbx, rax
    mov rax, 0
    cmp rbx, rax
    je .WhileEnd1

    mov rax, QWORD [rbp - 2060]
    mov rbx, rbp
    sub rbx, r11
    add r11, 8
    mov QWORD [rbx], rax
    call getchar

    mov rbx, rbp
    sub rbx, r11
    mov r14, QWORD [rbx]
    mov QWORD [rbp - 2076], r14
    sub r11, 8

    mov rax, QWORD [rbp - 2076]
    mov rbx, rax
    mov rax, 32
    cmp rbx, rax
    je .IfEnd2

    mov rax, QWORD [rbp - 2076]
    mov rbx, rax
    mov rax, 10
    cmp rbx, rax
    je .IfEnd3

    mov rax, 1
    add QWORD [rbp - 2108], rax

    mov rax, QWORD [rbp - 2108]
    sub rax, 1
    imul rax, rax, 8
    add rax, 2084
    lea rbx, [rbp]
    sub rbx, rax
    mov rax, QWORD [rbp - 2076]
    mov QWORD [rbx], rax

    .IfEnd3:

    jmp .ElseEnd2
    .IfEnd2:

    mov r12, rbp
    sub r12, 2084
    mov rax, r12
    mov rbx, rbp
    sub rbx, r11
    add r11, 8
    mov QWORD [rbx], rax
    mov rax, QWORD [rbp - 2108]
    mov rbx, rbp
    sub rbx, r11
    add r11, 8
    mov QWORD [rbx], rax
    call stoi

    mov rbx, rbp
    sub rbx, r11
    mov r14, QWORD [rbx]
    mov QWORD [rbp - 2124], r14
    sub r11, 8

    mov rax, QWORD [rbp - 2052]
    sub rax, 1
    imul rax, rax, 8
    add rax, 1812
    lea rbx, [rbp]
    sub rbx, rax
    mov rax, QWORD [rbp - 2124]
    mov QWORD [rbx], rax

    mov rax, 1
    add QWORD [rbp - 2052], rax

    mov rax, 0
    mov QWORD [rbp - 2108], rax

    .ElseEnd2:

    mov rax, QWORD [rbp - 2076]
    mov rbx, rax
    mov rax, 10
    cmp rbx, rax
    jne .IfEnd4

    mov r12, rbp
    sub r12, 2084
    mov rax, r12
    mov rbx, rbp
    sub rbx, r11
    add r11, 8
    mov QWORD [rbx], rax
    mov rax, QWORD [rbp - 2108]
    mov rbx, rbp
    sub rbx, r11
    add r11, 8
    mov QWORD [rbx], rax
    call stoi

    mov rbx, rbp
    sub rbx, r11
    mov r14, QWORD [rbx]
    mov QWORD [rbp - 2124], r14
    sub r11, 8

    mov rax, QWORD [rbp - 2052]
    sub rax, 1
    imul rax, rax, 8
    add rax, 1812
    lea rbx, [rbp]
    sub rbx, rax
    mov rax, QWORD [rbp - 2124]
    mov QWORD [rbx], rax

    mov rax, 0
    mov QWORD [rbp - 2108], rax

    .IfEnd4:

    jmp .WhileStart1
    .WhileEnd1:

    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, msg3
    mov rdx, 1
    syscall

    call ShowScreen

    mov rax, QWORD [rbp - 1804]
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

    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, msg5
    mov rdx, 1
    syscall

    pop rbp
    mov rax, 0x2000001
    mov rdi, 0
    syscall

ShowScreen:
    sub r11, 8
    add r11, 8

    mov rax, 0
    mov QWORD [rbp - 2132], rax

    mov rax, 0
    mov QWORD [rbp - 2140], rax

    .WhileStart2:
    mov rax, QWORD [rbp - 2140]
    mov rbx, rax
    mov rax, QWORD [rbp - 1796]
    cmp rbx, rax
    jge .WhileEnd2

    .WhileStart3:
    mov rax, QWORD [rbp - 2132]
    mov rbx, rax
    mov rax, 10
    cmp rbx, rax
    jge .WhileEnd3

    mov rax, QWORD [rbp - 2140]
    mov rbx, QWORD [rbp - 1804]
    imul rbx
    add rax, QWORD [rbp - 2132]
    imul rax, rax, 8
    add rax, 996
    lea rbx, [rbp]
    sub rbx, rax
    mov rax, QWORD [rbx]
    mov BYTE [rbp + 8], al
    mov rdx, rbp
    add rdx, 8
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, rdx
    mov rdx, 1
    syscall

    mov rax, 1
    add QWORD [rbp - 2132], rax

    jmp .WhileStart3
    .WhileEnd3:

    mov rax, 0
    mov QWORD [rbp - 2132], rax

    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, msg6
    mov rdx, 1
    syscall

    mov rax, 1
    add QWORD [rbp - 2140], rax

    jmp .WhileStart2
    .WhileEnd2:
    ret
exit:
    sub r11, 8
    mov rbx, rbp
    sub rbx, r11
    sub r11, 8
    mov rax, QWORD [rbx]
    mov QWORD [rbp - 2148], rax
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
    mov QWORD [rbp - 2172], rax
    mov rbx, rbp
    sub rbx, r11
    sub r11, 8
    mov rax, QWORD [rbx]
    mov QWORD [rbp - 2164], rax
    mov rbx, rbp
    sub rbx, r11
    sub r11, 8
    mov rax, QWORD [rbx]
    mov QWORD [rbp - 2156], rax
    add r11, 8

    mov rax, 0
    mov QWORD [rbp - 2180], rax
    mov QWORD [rbp - 2188], rax
    mov QWORD [rbp - 2196], rax
    mov QWORD [rbp - 2204], rax
    mov QWORD [rbp - 2212], rax
    mov QWORD [rbp - 2220], rax
    mov QWORD [rbp - 2228], rax
    mov QWORD [rbp - 2236], rax
    mov QWORD [rbp - 2244], rax
    mov QWORD [rbp - 2252], rax
    mov QWORD [rbp - 2260], rax
    mov QWORD [rbp - 2268], rax
    mov QWORD [rbp - 2276], rax
    mov QWORD [rbp - 2284], rax
    mov QWORD [rbp - 2292], rax
    mov QWORD [rbp - 2300], rax
    mov QWORD [rbp - 2308], rax
    mov QWORD [rbp - 2316], rax
    mov QWORD [rbp - 2324], rax
    mov QWORD [rbp - 2332], rax
    mov QWORD [rbp - 2340], rax
    mov QWORD [rbp - 2348], rax
    mov QWORD [rbp - 2356], rax
    mov QWORD [rbp - 2364], rax
    mov QWORD [rbp - 2372], rax
    mov QWORD [rbp - 2380], rax
    mov QWORD [rbp - 2388], rax
    mov QWORD [rbp - 2396], rax
    mov QWORD [rbp - 2404], rax
    mov QWORD [rbp - 2412], rax
    mov QWORD [rbp - 2420], rax
    mov QWORD [rbp - 2428], rax

    mov rax, 0
    mov QWORD [rbp - 2436], rax

    .WhileStart4:
    mov rax, QWORD [rbp - 2436]
    mov rbx, rax
    mov rax, QWORD [rbp - 2164]
    cmp rbx, rax
    jge .WhileEnd4

    mov rax, 31
    sub rax, QWORD [rbp - 2436]
    imul rax, rax, 8
    add rax, 2180
    lea rbx, [rbp]
    sub rbx, rax
    mov r13, QWORD [rbp - 2156]
    mov rax, QWORD [r13]
    mov QWORD [rbx], rax

    mov rax, 1
    add QWORD [rbp - 2436], rax

    mov rax, 8
    sub QWORD [rbp - 2156], rax

    jmp .WhileStart4
    .WhileEnd4:

    mov rax, 4
    mov r13, rax
    mov rax, QWORD [rbp - 2172]
    mov rdi, rax
    mov rax, 31
    imul rax, rax, 8
    add rax, 2180
    lea rbx, [rbp]
    sub rbx, rax
    mov rax, rbx
    mov rsi, rax
    mov rax, QWORD [rbp - 2164]
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
    mov QWORD [rbp - 2444], rax
    add r11, 8
    mov QWORD [rbp - 2452], 0

    mov rax, 3
    mov r13, rax
    mov rax, QWORD [rbp - 2444]
    mov rdi, rax
    mov r12, rbp
    sub r12, 2452
    mov rax, r12
    mov rsi, rax
    mov rax, 1
    mov rdx, rax
    mov rax, r13
    add rax, 33554432
    syscall

    mov rax, QWORD [rbp - 2452]
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
    mov QWORD [rbp - 2468], rax
    mov rbx, rbp
    sub rbx, r11
    sub r11, 8
    mov rax, QWORD [rbx]
    mov QWORD [rbp - 2460], rax
    add r11, 8

    mov rax, 5
    mov r13, rax
    mov rax, QWORD [rbp - 2460]
    mov rdi, rax
    mov rax, QWORD [rbp - 2468]
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
close:
    sub r11, 8
    mov rbx, rbp
    sub rbx, r11
    sub r11, 8
    mov rax, QWORD [rbx]
    mov QWORD [rbp - 2476], rax
    add r11, 8

    mov rax, 6
    mov r13, rax
    mov rax, QWORD [rbp - 2476]
    mov rdi, rax
    mov rax, r13
    add rax, 33554432
    syscall
    ret
is_open:
    sub r11, 8
    mov rbx, rbp
    sub rbx, r11
    sub r11, 8
    mov rax, QWORD [rbx]
    mov QWORD [rbp - 2484], rax
    add r11, 8

    mov rax, QWORD [rbp - 2484]
    mov rbx, rax
    mov rax, 2
    cmp rbx, rax
    jne .IfEnd5

    mov rax, 0
    add r11, 8
    mov rbx, rbp
    sub rbx, r11
    mov QWORD [rbx], rax
    ret

    .IfEnd5:

    mov rax, 1
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
    mov QWORD [rbp - 2500], rax
    mov rbx, rbp
    sub rbx, r11
    sub r11, 8
    mov rax, QWORD [rbx]
    mov QWORD [rbp - 2492], rax
    add r11, 8

    mov rax, 0
    mov QWORD [rbp - 2508], rax

    .WhileStart5:
    mov r13, QWORD [rbp - 2492]
    mov rax, QWORD [r13]
    mov rbx, rax
    mov rax, 0
    cmp rbx, rax
    je .WhileEnd5
    mov rax, QWORD [rbp - 2500]
    add rax, QWORD [rbp - 2508]
    mov rbx, rax
    mov r13, QWORD [rbp - 2492]
    mov rax, QWORD [r13]
    mov BYTE [rbx], al

    mov rax, 8
    sub QWORD [rbp - 2492], rax

    mov rax, 1
    add QWORD [rbp - 2508], rax

    jmp .WhileStart5
    .WhileEnd5:
    ret
stoi:
    sub r11, 8
    mov rbx, rbp
    sub rbx, r11
    sub r11, 8
    mov rax, QWORD [rbx]
    mov QWORD [rbp - 2524], rax
    mov rbx, rbp
    sub rbx, r11
    sub r11, 8
    mov rax, QWORD [rbx]
    mov QWORD [rbp - 2516], rax
    add r11, 8

    mov rax, QWORD [rbp - 2524]
    sub rax, 1
    mov QWORD [rbp - 2532], rax

    mov rax, 0
    mov QWORD [rbp - 2540], rax

    mov rax, 1
    mov QWORD [rbp - 2548], rax
    mov QWORD [rbp - 2556], 0

    .WhileStart6:
    mov rax, QWORD [rbp - 2532]
    mov rbx, rax
    mov rax, 0
    cmp rbx, rax
    jl .WhileEnd6

    mov rax, QWORD [rbp - 2532]
    mov rbx, 8
    imul rbx
    mov QWORD [rbp - 2556], rax

    mov rax, QWORD [rbp - 2516]
    sub rax, QWORD [rbp - 2556]
    mov QWORD [rbp - 2556], rax

    mov r13, QWORD [rbp - 2556]
    mov rax, QWORD [r13]
    mov QWORD [rbp - 2556], rax

    mov rax, 48
    sub QWORD [rbp - 2556], rax

    mov rax, QWORD [rbp - 2548]
    imul QWORD [rbp - 2556]
    mov QWORD [rbp - 2556], rax

    mov rax, QWORD [rbp - 2556]
    add QWORD [rbp - 2540], rax

    mov rax, 10
    imul QWORD [rbp - 2548]
    mov QWORD [rbp - 2548], rax

    mov rax, 1
    sub QWORD [rbp - 2532], rax

    jmp .WhileStart6
    .WhileEnd6:

    mov rax, QWORD [rbp - 2540]
    add r11, 8
    mov rbx, rbp
    sub rbx, r11
    mov QWORD [rbx], rax
    ret
    ret

msg1: db "No Input File"
msg2: db 10
msg3: db 10
msg5: db 10
msg6: db 10

