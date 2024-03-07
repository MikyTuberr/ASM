.386
rozkazy SEGMENT use16
 ASSUME CS:rozkazy 

wyswietl_AL PROC
	push ax
	push cx
	push dx
  
	mov cl, 10 
	mov ah, 0 

	div cl
	add ah, 30H
	mov es:[bx+4], ah 
	mov ah, 0
	div cl 
	add ah, 30H 
	mov es:[bx+2], ah 
	add al, 30H 
	mov es:[bx+0], al 

	mov al, 00001111B
	mov es:[bx+1],al
	mov es:[bx+3],al
	mov es:[bx+5],al

	pop dx
	pop cx
	pop ax
	ret 
wyswietl_AL ENDP


obsluga_klaw PROC
	push ax
	push bx
	push es

	mov ax, 0B800h 
	mov es, ax

	mov bx, cs:licznik

	in al, 60h
	call wyswietl_AL

	cmp bx,4000
	jb wysw_dalej 

	mov bx, 0

wysw_dalej:
	mov cs:licznik,bx

	pop es
	pop bx
	pop ax

	jmp dword PTR cs:wektor9

	licznik dw 320 
	wektor9 dd ?
obsluga_klaw ENDP

zacznij:
	;mov al, 0
	;mov ah, 5
	;int 10
	mov ax, 0
	mov ds,ax

	mov eax,ds:[36] ; adres fizyczny 0*16 + 32 = 32
	mov cs:wektor9, eax

	mov ax, SEG obsluga_klaw ; czêœæ segmentowa adresu
	mov bx, OFFSET obsluga_klaw ; offset adresu
	cli ; zablokowanie przerwañ

	mov ds:[36], bx ; OFFSET
	mov ds:[38], ax ; cz. segmentowa
	sti ;odblokowanie przerwañ

; oczekiwanie na naciœniêcie klawisza 'x'
aktywne_oczekiwanie:
	mov ah,1
	int 16H

	jz aktywne_oczekiwanie

	mov ah, 0
	int 16H
	cmp ah, 1 ; porównanie z scan codem escapea
	jne aktywne_oczekiwanie ; skok, gdy inny znak 

	mov eax, cs:wektor9
	cli
	mov ds:[36], eax 

	sti

	mov al, 0
	mov ah, 4CH
	int 21H
rozkazy ENDS


nasz_stos SEGMENT stack
	db 128 dup (?)
nasz_stos ENDS

END zacznij