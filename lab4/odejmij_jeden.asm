.686
.model flat
public _odejmij_jeden
.code
_odejmij_jeden PROC
	push ebp ; zapisanie zawartości EBP na stosie
	mov ebp,esp ; kopiowanie zawartości ESP do EBP
	push ebx ; przechowanie zawartości rejestru EBX

	mov ebx, [ebp+8] ; ebx -> adres adresu
	mov eax, [ebx] ;eax -> adres
	dec DWORD PTR [eax] ;wartość zmniejszana o 1
	
	pop ebx
	pop ebp
	ret
_odejmij_jeden ENDP
 END
