;This program adds numbers from 25 down to 15 using a decrementing loop
;Sum = 25 + 24 + ... + 15 = 220

section .data  
    sum dd 0

section .text
    global _start

_start:
    mov ecx, 25   ; Start number
    mov eax, 0    ; sum = 0

loop_start:
     add eax, ecx    ;sum += ecx
     dec ecx     ; stop when ecx == 14
     jne loop_start

     mov [sum], eax

     mov eax, 1   ; syscall: exit
     int 0x80
     