; JA / JNBE → Jump if Above
section .data
    str_above db "AX > BX (Above) - Marlyn Wairimu Muchina, 169319",10,0
    len_above equ $ - str_above

    str_not_above db "AX <= BX (Not Above) - Marlyn Wairimu Muchina, 169319",10,0
    len_not_above equ $ - str_not_above

section .text
    global _start
_start:
    mov ax, 7
    mov bx, 3
    cmp ax, bx
    ja above

    ; Case: Not Above
    mov ecx, str_not_above
    mov edx, len_not_above
    jmp print

above:
    ; Case: Above
    mov ecx, str_above
    mov edx, len_above

print:
    mov eax,4       ; sys_write
    mov ebx,1       ; stdout
    int 0x80

    mov eax,1       ; sys_exit
    xor ebx,ebx
    int 0x80
