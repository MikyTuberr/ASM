.686
.model flat
.XMM
public _dylatacja_czasu
public _szybki_max

.data 
	stala_c dq 300000000.0000
	minus_jeden dq -1.00

.code
_szybki_max PROC
		push ebp
		mov ebp, esp
		push ebx
		push edx

		mov eax, [ebp + 20] ;eax -> n
		xor edx, edx ; edx -> 0
		mov ebx, 8
		div ebx
		mov ecx, eax ;ecx -> n/8

		mov eax, [ebp + 8] ; eax -> t_1[0]

		mov ebx, [ebp + 12] ; ebx -> t_2[0]

		mov edx, [ebp + 16] ; edx -> wynik[0]

petla:
		movups xmm1, [eax] 
		movups xmm2, [ebx] 

		PMAXSW xmm1, xmm2
		movups [edx], xmm1

		add edx, 16
		add eax, 16
		add ebx, 16
loop petla

		pop edx
		pop ebx
		pop ebp
		ret
_szybki_max ENDP


_dylatacja_czasu PROC
	push ebp
	mov ebp, esp

	finit ; coprocessor initialization
	
	fld dword ptr [ebp + 12] ; predkosc

	fmul st(0), st(0)

	fld qword ptr stala_c

	fmul st(0),st(0) ;st(0)-> c^2 st(1) -> v^2

	fdivp st(1), st(0)

	fld1

	fsub st(0), st(1)
	fxch
	fstp st(0)

	fsqrt

	fild dword ptr [ebp + 8] ; delta
	fxch
	fdivp
	
	pop ebp
	ret
_dylatacja_czasu ENDP

END