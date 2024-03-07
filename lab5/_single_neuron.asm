.686
.XMM
.model flat

public _single_neuron

.data
	
	minus_jeden dq -1.0000

.code

_single_neuron PROC
	push ebp	;prolog
	mov ebp, esp
	push ebx

	mov ecx, [ebp + 16] ;ecx -> n

	mov eax, [ebp + 12] ; eax -> w[0]
	mov ebx, [ebp + 8]; ebx -> X[0]

	finit ; initialize coprocessor
	fld qword ptr [eax] ; st(0) -> w[0]
	
	cmp ecx, 0 ; check loop overflow
	je one_arg

	add eax, 8 ; go to next index of double array w

etc:
	fld qword ptr [eax] ; load weight
	fld dword ptr [ebx] ; load number
	fmulp ; multiply them 
	faddp ; add to the sum

	add eax, 8 ; go to next index
	add ebx, 4
	
loop etc

	fldl2e ; log 2 e
	fmulp st(1), st(0) ; obliczenie suma * log 2 e
	fmul minus_jeden 
	
	fst st(1) ; kopiowanie obliczonej wartoœci do ST(1)
 
	frndint ; zaokr¹glenie do wartoœci ca³kowitej

	fsub st(1), st(0) ; obliczenie czêœci u³amkowej
	fxch ; zamiana ST(0) i ST(1)
	f2xm1
	fld1 ; liczba 1
	faddp st(1), st(0) ; dodanie 1 do wyniku

	fscale

	fstp st(1) ; st(0) -> e^-suma


	fld1
	fadd st(1), st(0) ;st(0) -> mianownik

	fdiv st(0), st(1)

one_arg:
	pop ebx
	pop ebp
	ret
_single_neuron ENDP
END
