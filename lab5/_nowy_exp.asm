.686
.model flat

public _nowy_exp

.code
_nowy_exp PROC
	push ebp
	mov ebp, esp ; prolog
	
	mov ecx, 20 ; licznik 

	finit ;inicjalizacja koprocesora

	fld dword ptr [ebp + 8] ;pobranie x st(0)=x 
	fld1 ;zaladowanie 1 st(0)=1 st(1)=x
	fadd st(1), st(0) ;dodwanie pierwszych dwoch elemntow  st(4)
	fstp st(0)

	fld dword ptr [ebp+8]  ; ST(3) - x (do potêgowania)
	fld1                   ; ST(2) - mno¿nik mianownika
	fld1                   ; ST(1) - mianownik (do dzielenia)
    	fld dword ptr [ebp+8]  ; ST(0) - bierz¹cy wyraz (x)

	petla:
	fmul st(0), st(3) ; licznik
	fxch st(1)
	fadd st(0),st(2)  ;dodanie 1 do mianownika
	fxch st(1) 
	fdiv st(0), st(1) ; dzielenie licznik przez mianownik
	fadd st(4), st(0) ; suma do st(4)
	loop petla

	fstp st(0) ;st(3)
	fstp st(0) ;st(2)
	fstp st(0) ;st(1)
	fstp st(0) ;st(0)

	pop ebp
	ret
_nowy_exp ENDP
END
