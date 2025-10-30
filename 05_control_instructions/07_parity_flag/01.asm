; JP / JPE → Jump if Parity Even

section .data
    msg_even db "Parity Even (PF=1) - Hello this is Marlyn Wairimu Muchina, 169319",10,0
    len_even equ $ - msg_even

    msg_odd db "Parity Odd (PF=0) - Hello this is Marlyn Wairimu Muchina, 169319",10,0
    len_odd equ $ - msg_odd

section .text
    global _start
_start:
    mov al,3              ; 00000011b → two 1s → even parity
    test al,al
    jp even                ; jump if PF=1

    ; Case: Odd parity
    mov ecx, msg_odd
    mov edx, len_odd
    jmp print

even:
    ; Case: Even parity
    mov ecx, msg_even
    mov edx, len_even

print:
    mov eax,4             ; sys_write
    mov ebx,1             ; stdout
    int 0x80

    mov eax,1             ; sys_exit
    xor ebx,ebx
    int 0x80
