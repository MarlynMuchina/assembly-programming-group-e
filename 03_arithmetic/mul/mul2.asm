
section .data
    num1 dw 300
    num2 dw 200
    result dd 0         ; 32-bit result

section .text
    global _start

_start:
    mov ax, [num1]
    mul word [num2]     ; DX:AX = AX * num2
    mov [result], ax    ; lower 16 bits
    mov [result+2], dx  ; upper 16 bits

    mov eax, 1
    xor ebx, ebx
    int 0x80


