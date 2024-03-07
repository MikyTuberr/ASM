.686
.model flat

public _szukaj_max

.code
_szukaj_max PROC
	push ebp			; zapisanie zawartości EBP na stosie
	mov ebp, esp		; kopiowanie zawartości ESP do EBP

	mov eax, [ebp+8]	; liczba x
	cmp eax, [ebp+12]	; porownanie liczb x i y
	jge x_wieksza		; skok, gdy x >= y

	; przypadek x < y
	mov eax, [ebp+12]	; liczba y
	cmp eax, [ebp+16]	; porownanie liczb y i z
	jge y_wieksza		; skok, gdy y >= z

	; przypadek y < z
	mov eax , [ebp+16]	; liczba z
	cmp eax, [ebp+20]	; porownanie liczb z i d
	jge wpisz_z		; skok, gdy z >= d

wpisz_w: 
	mov eax, [ebp+20] ; liczba d

zakoncz:
	pop ebp
	ret

x_wieksza:
	cmp eax, [ebp+16] ; porownanie x i z
	jge x_wieksza2 ; skok, gdy x >= z
	jmp z_wieksza

x_wieksza2:
	cmp eax, [ebp+20] ; porownanie x i d
	jge zakoncz
	jmp wpisz_w

y_wieksza:
	cmp eax, [ebp+20] ; porownanie y i d
	jge zakoncz
	jmp wpisz_w

z_wieksza:
	mov eax, [ebp+16]
	cmp eax, [ebp+20]
	jge wpisz_z
	jmp wpisz_w

wpisz_z:
	mov eax, [ebp+16] ; wpisuje z
	jmp zakoncz

_szukaj_max ENDP
END
