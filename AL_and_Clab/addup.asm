;This program adds numbers from 15 to 25 using a loop
;Sum = 15 + 16 + 17+ ... + 25 = 220

section .data
sum dd 0

section .text
global _start

_start:
    mov ecx, 15   ;start number
    mov eax, 0    ; sum = 0

loop_start:
    add eax, ecx      ;sum+=ecx
    inc ecx           ;ecx = ecx + 1
    cmp ecx, 26      ;loop until ecx ==26
    jne loop_start

    mov [sum], eax      ; store result in memory

    ;exit program mov eax, 1    ; syscall: exit   
    int 0x80 