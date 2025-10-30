; JNC → Jump if No Carry

section .data
    msg_carry db "Carry occurred (CF=1) - Hello this is Marlyn Wairimu Muchina, 169319",10,0
    len_carry equ $ - msg_carry

    msg_nocarry db "No carry (CF=0) - Hello this is Marlyn Wairimu Muchina, 169319",10,0
    len_nocarry equ $ - msg_nocarry

section .text
    global _start
_start:
    mov ax,5
    add ax,2              ; no carry, CF=0
    jnc nocarry            ; jump if no carry

    ; Case: Carry occurred
    mov ecx, msg_carry
    mov edx, len_carry
    jmp print

nocarry:
    ; Case: No carry
    mov ecx, msg_nocarry
    mov edx, len_nocarry

print:
    mov eax,4             ; sys_write
    mov ebx,1             ; stdout
    int 0x80

    mov eax,1             ; sys_exit
    xor ebx,ebx
    int 0x80
