section .text
    global factorial     ; make function accessible from C  

; unsigned long long factorial(int n)
factorial:
         push ebp
         mov ebp, esp
         mov eax, [ebp+8]     ;   get argument (n)
         cmp eax, 1
         jbe .base_case   ; if n<=1, return 1

         dec eax
         push eax
         call factorial
         ; recursive call factorial(n-1)
         pop ecx

         mov ebx, [ebp+8]     ;n
         imul eax, ebx     ; result = n* factorial(n-1)
         jmp .done

.base_case:
         mov eax, 1      ;factorial(0 or 1) = 1

.done:
         pop ebp
         ret