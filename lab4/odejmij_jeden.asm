.686
.model flat
public _odejmij_jeden
.code
_odejmij_jeden PROC
	push ebp ; zapisanie zawartoœci EBP na stosie
	mov ebp,esp ; kopiowanie zawartoœci ESP do EBP
	push ebx ; przechowanie zawartoœci rejestru EBX

	mov ebx, [ebp+8] ; ebx -> adres adresu
	mov eax, [ebx] ;eax -> adres
	dec DWORD PTR [eax] ;wartoœæ zmniejszana o 1
	
	pop ebx
	pop ebp
	ret
_odejmij_jeden ENDP
 END
