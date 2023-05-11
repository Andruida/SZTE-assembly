.intel_syntax noprefix

.data


.text
.global caseInvert
caseInvert: # void caseInvert ( const char input[] , char∗ output ) ;

    push ebp
    mov ebp, esp

    push ebx
    push ecx
    push edx
    push esi
    push edi

    mov esi, [ebp+4*2] # input
    mov edi, [ebp+4*3] # output

# FUNCTION BODY

    xor ecx, ecx
    xor edx, edx

_loop:
    mov dl, [esi + ecx]
    cmp edx, 0
    je _loop_break

_if_lowercase:
    xor eax, eax
    xor ebx, ebx

    cmp edx, 'a'
    setge al

    cmp edx, 'z'
    setle bl

    and eax, ebx
    cmp eax, 1
    jne _if_uppercase

    sub edx, 32
    jmp _if_end

_if_uppercase:
    xor eax, eax
    xor ebx, ebx

    cmp edx, 'A'
    setge al

    cmp edx, 'Z'
    setle bl

    and eax, ebx
    cmp eax, 1
    jne _if_end

    add edx, 32
    jmp _if_end

_if_end:
    mov [edi+ecx], dl

_loop_continue:
    inc ecx
    jmp _loop

_loop_break:
    movb [edi+ecx], 0


# FUNCTION BODY END

    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx

    mov esp, ebp
    pop ebp

    xor eax, eax

    ret