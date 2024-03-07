.686
.model flat

public _dzielenie

.code
_dzielenie PROC
    push ebp
    mov ebp, esp
    push ebx

    xor edx, edx        ; edx -> 0
    mov ecx, [ebp+8]    ; ecx -> *dzielna
    mov eax, [ecx]      ; eax -> dzielna

    ;dzielna edx:eax

    mov ebx, [ebp+12]   ; ebx -> **dzielnik 
    mov ecx, [ebx]      ; ecx -> *dzielnik
    mov ebx, [ecx]      ; ebx -> dzielnik

    test ebx, ebx     
    jz zero_divisor_error 

    cdq              ; Konwertuj EAX na wartoœæ ze znakiem w EDX:EAX
    idiv ebx         ; Dzielenie EDX:EAX przez EBX

    pop ebx
    pop ebp
    ret

zero_divisor_error:

    pop ebx
    pop ebp
    ret
_dzielenie ENDP

END