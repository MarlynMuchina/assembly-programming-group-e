; JGE / JNL → Jump if Greater or Equal

section .data
    msg_ge db "AX >= BX (Signed Greater or Equal) - Marlyn Wairimu Muchina, 169319",10,0
    len_ge equ $ - msg_ge

    msg_less db "AX < BX (Signed Less) - Marlyn Wairimu Muchina, 169319",10,0
    len_less equ $ - msg_less

section .text
    global _start
_start:
    mov ax,5
    mov bx,5
    cmp ax,bx
    jge ge_label            ; jump if AX >= BX

    ; Case: AX < BX
    mov ecx, msg_less
    mov edx, len_less
    jmp print

ge_label:
    ; Case: AX >= BX
    mov ecx, msg_ge
    mov edx, len_ge

print:
    mov eax,4               ; sys_write
    mov ebx,1               ; stdout
    int 0x80

    mov eax,1               ; sys_exit
    xor ebx,ebx
    int 0x80
