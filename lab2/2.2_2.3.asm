; Przyk³ad wywo³ywania funkcji MessageBoxA i MessageBoxW
.686
.model flat
extern _ExitProcess@4 : PROC
extern _MessageBoxA@16 : PROC
extern _MessageBoxW@16 : PROC
public _main
.data
	;tytul_Unicode dw 'T', 'e','k','s','t',' ','w',' '
	;dw 'f','o','r','m','a','c','i','e',' '
	;dw 'U','T','F','-','1','6', 0
	;tekst_Unicode dw 'K','a', 017Ch ,'d','y',' ','z','n','a','k',' '
	;dw 'z','a','j','m','u','j','e',' '
	;dw '1','6',' ','b','i','t', 00F3H ,'w', 0
	;tytul_Win1250 db 'Tekst w standardzie Windows 1250', 0
	;tekst_Win1250 db 'Ka¿dy znak zajmuje 8 bitów', 0

	tytulZ_Unicode dw 'Z','n','a','k','i', 0
	tekstZ_Unicode dw 'T','o', ' ', 'j','e','s','t',' ','r','a','k','i','e','t','a', 0D83Dh, 0DE80h, 10
	dw 'i',' ', 'k', 'a', 'r', 'e', 't', 'k', 'a', 0D83Dh, 0DE91h, 0
.code
_main PROC
	 ;push 0 ; sta³a MB_OK
	 ;push OFFSET tytul_Win1250 ; adres obszaru zawieraj¹cego tytu³
	 ;push OFFSET tekst_Win1250 ; adres obszaru zawieraj¹cego tekst
	; push 0 ; NULL
	 ;call _MessageBoxA@16

	 ;push 0 ; stala MB_OK
	 ;push OFFSET tytul_Unicode ; adres obszaru zawieraj¹cego tytu³
	 ;push OFFSET tekst_Unicode ; adres obszaru zawieraj¹cego tekst
	 ;push 0 ; NULL
	 ;call _MessageBoxW@16

	 push 0 ; stala MB_OK
	 push OFFSET tytulZ_Unicode ; adres obszaru zawieraj¹cego tytu³
	 push OFFSET tekstZ_Unicode ; adres obszaru zawieraj¹cego tekst
	 push 0 ; NULL
	 call _MessageBoxW@16

	 push 0 ; kod powrotu programu
	 call _ExitProcess@4
_main ENDP
END
