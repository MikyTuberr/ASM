.686
.model flat

public _objetosc_stozka

.data 
	jedna_trzecia dd 0.333

.code
_objetosc_stozka PROC
	push ebp
	mov ebp, esp

	finit ; coprocessor initialization

	fldpi
	fmul jedna_trzecia
	fmul dword ptr [ebp + 16] ;st(0) -> 1/3 * h * pi
	fild dword ptr [ebp + 12] ;st(0) -> r st(1) -> 1/3*h*pi
	fmul st(0), st(0)
	fild dword ptr [ebp + 8] ; st(0) -> R st(1) -> r^2 st(2) -> 1/3*h*pi
	fmul st(0), st(0)
	fild dword ptr [ebp+ 12]
	fild dword ptr [ebp + 8]
	fmulp st(1), st(0) ;st(0) -> r*R st(1)-> R^2 st(2) -> r^2 st(3) -> 1/3*h*pi

	faddp
	faddp
	fmulp

	pop ebp
	ret
_objetosc_stozka ENDP

END