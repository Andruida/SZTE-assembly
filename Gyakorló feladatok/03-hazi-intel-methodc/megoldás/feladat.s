.intel_syntax noprefix
.section .data
    avg: .int 0

.section .text
.global filterElements
filterElements: # int filterElements(int* input, int length, int* output)
    push ebp
    mov ebp, esp

    push ebx
    push ecx
    push edx
    push esi
    push edi

    mov esi, [ebp + 4*2]
    mov edx, [ebp + 4*3]
    mov edi, [ebp + 4*4]

    mov ecx, edx
    xor eax, eax


_loop1:
    add eax, [esi + 4*ecx-4]

    loop _loop1

    mov ecx, edx
    xor edx, edx
    cdq
    idiv ecx
    mov ebx, eax

    mov edx, ecx

    xor eax, eax
    xor ecx, ecx

_loop2:
    cmp [esi + 4*ecx], ebx
    jle _ifend
    push edx
    mov edx, [esi + 4*ecx]
    mov [edi + 4*eax], edx
    pop edx
    inc eax

_ifend:
    inc ecx
    cmp ecx, edx
    jl _loop2

    



    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx

    mov esp, ebp
    pop ebp

    ret