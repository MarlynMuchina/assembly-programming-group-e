; jne_jnz.asm
section .data
    msg_equal db "AX == BX (Equal, ZF=1) - Marlyn Wairimu Muchina, 169319",10,0
    len_equal equ $ - msg_equal 

    msg_not_equal db "AX != BX (Not Equal, ZF=0) - Marlyn Wairimu Muchina, 169319",10,0
    len_not_equal equ $ - msg_not_equal

section .text
    global _start
_start:
    mov ax, 5
    mov bx, 3
    cmp ax, bx
    jne not_equal

    ; Case: Equal
    mov ecx, msg_equal
    mov edx, len_equal
    jmp print

not_equal:
    ; Case: Not Equal
    mov ecx, msg_not_equal
    mov edx, len_not_equal

print:
    mov eax,4       ; sys_write
    mov ebx,1       ; stdout
    int 0x80

    mov eax,1       ; sys_exit
    xor ebx,ebx
    int 0x80
