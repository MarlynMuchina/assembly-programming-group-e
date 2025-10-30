; JC → Jump if Carry

section .data
    msg_carry db "Carry occurred (CF=1) - Hello this is Marlyn Wairimu Muchina, 169319",10,0
    len_carry equ $ - msg_carry

    msg_nocarry db "No carry (CF=0) - Hello this is Marlyn Wairimu Muchina, 169319",10,0
    len_nocarry equ $ - msg_nocarry

section .text
    global _start
_start:
    mov ax,0FFFFh
    add ax,1              ; sets CF=1 because 0xFFFF + 1 = 0x10000
    jc carry              ; jump if carry flag set

    ; Case: No carry
    mov ecx, msg_nocarry
    mov edx, len_nocarry
    jmp print

carry:
    ; Case: Carry
    mov ecx, msg_carry
    mov edx, len_carry

print:
    mov eax,4             ; sys_write
    mov ebx,1             ; stdout
    int 0x80

    mov eax,1             ; sys_exit
    xor ebx,ebx
    int 0x80
