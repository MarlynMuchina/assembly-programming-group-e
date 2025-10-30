; JLE / JNG → Jump if Less or Equal

section .data
    msg_le db "AX <= BX (Signed Less or Equal) - Marlyn Wairimu Muchina, 169319",10,0
    len_le equ $ - msg_le

    msg_greater db "AX > BX (Greater) - Marlyn Wairimu Muchina, 169319",10,0
    len_greater equ $ - msg_greater

section .text
    global _start
_start:
    mov ax,5
    mov bx,5
    cmp ax,bx
    jle le_label             ; jump if AX <= BX

    ; Case: AX > BX
    mov ecx, msg_greater
    mov edx, len_greater
    jmp print

le_label:
    ; Case: AX <= BX
    mov ecx, msg_le
    mov edx, len_le

print:
    mov eax,4                ; sys_write
    mov ebx,1                ; stdout
    int 0x80

    mov eax,1                ; sys_exit
    xor ebx,ebx
    int 0x80
