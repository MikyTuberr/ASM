; program przykładowy (wersja 32-bitowa)
.686
.model flat

extern _ExitProcess@4 : PROC
extern __write : PROC ; (dwa znaki podkreślenia)

public _main

.data
	tekst  db  10, 'Nazywam si', 169				; polskie znaki wyswietlane przez funkcje __write trzeba kodowac standardem Latin 2
	db	' Piotr Lachowicz' , 10 
    db  'M', 162
	db  'j pierwszy 32-bitowy program ' 
    db  'asemblerowy dzia',136
	db  'a ju', 190
	db	' poprawnie!', 10 
	koniec db ' '

.code
	_main PROC
		mov ecx, OFFSET koniec - OFFSET tekst ; liczba znaków wyświetlanego tekstu

		; wywołanie funkcji ”write” z biblioteki języka C
			push ecx ; liczba znaków wyświetlanego tekstu
			push dword PTR OFFSET tekst ; położenie obszaru ze znakami
		
			push dword PTR 1 ; uchwyt urządzenia wyjściowego
			call __write ; wyświetlenie znaków (dwa znaki podkreślenia _ )
			
			add esp, 12 ; usunięcie parametrów ze stosu

		; zakończenie wykonywania programu
			push dword PTR 0 ; kod powrotu programu
			call _ExitProcess@4
	_main ENDP
END