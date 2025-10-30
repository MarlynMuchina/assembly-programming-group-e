; JS → Jump if Sign

section .data
    msg_neg db "Number is Negative (SF=1) - Hello this is Marlyn Wairimu Muchina, 169319",10,0
    len_neg equ $ - msg_neg

    msg_pos db "Number is Positive (SF=0) - Hello this is Marlyn Wairimu Muchina, 169319",10,0
    len_pos equ $ - msg_pos

section .text
    global _start
_start:
    mov ax,-5
    test ax,ax
    js negative               ; jump if SF=1 (negative)

    ; Case: Positive
    mov ecx, msg_pos
    mov edx, len_pos
    jmp print

negative:
    ; Case: Negative
    mov ecx, msg_neg
    mov edx, len_neg

print:
    mov eax,4                 ; sys_write
    mov ebx,1                 ; stdout
    int 0x80

    mov eax,1                 ; sys_exit
    xor ebx,ebx
    int 0x80
