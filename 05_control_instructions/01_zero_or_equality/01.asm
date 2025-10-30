; jump if equal 

section .data
    msg_equal db "AX == BX (Equal, ZF=1) - Marlyn Wairimu Muchina, 169319",10,0
    len_equal equ $ - msg_equal 
    ;10 decimal / 0x0A hex - newline character to move cursor to the next line after printing
    ;0 - null terminator
    msg_not_equal db "AX != BX (Not Equal, ZF=0) - Marlyn Wairimu Muchina, 169319",10,0
    len_not_equal equ $ - msg_not_equal

section .text
    global _start
_start:
    mov ax, 5
    mov bx, 5

    ; cmp ax, bx performs (ax - bx), 
    ; updates flags but does not store result
    cmp ax, bx
    je equal

    mov ecx, msg_not_equal ; ecx = pointer to message
    jmp print

equal:
    mov ecx, msg_equal ; ecx = pointer to message

print:
    mov eax,4   ; syscall number for sys_write
    mov ebx,1   ; file descriptor (1 = stdout)
    mov edx,30  ; length of the message to be cmp ecx, msg_equal
    je .print_equal
    mov edx, len_not_equal
    jmp .do_print

.print_equal:
    mov edx, len_equal

.do_print:
    int 0x80
