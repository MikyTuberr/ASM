.686
.model flat

extern _GetSystemDirectoryA@8 : PROC

public _check_system_dir

.data
   adres_bufora db 260 dup(?) 
   licznik_petli db 0

.code
_check_system_dir PROC
    push ebp
    mov ebp, esp
    push ebx

    push 260
    push OFFSET adres_bufora
    call _GetSystemDirectoryA@8
    
    mov ecx, eax
    mov dword ptr licznik_petli, ecx
    mov ebx, [ebp + 8]
    
ptl:
    xor edx, edx

    mov eax, dword ptr adres_bufora[ecx]
    and eax, 0FFH

    mov edx, [ebx]
    add edx, dword ptr licznik_petli
    movzx edx, byte ptr [edx]

    cmp eax, edx
    jne zwroc_zero

    sub licznik_petli, 1
loop ptl

zwroc_jeden:
    mov eax, 1
    jmp zakoncz

zwroc_zero:
    mov eax, 0

zakoncz:
    pop ebx
    pop ebp
    ret
_check_system_dir ENDP

END