.686
.model flat
.XMM
public _mul_at_once

.code
_mul_at_once PROC
	push ebp
	mov ebp, esp

	finit ; coprocessor initialization

	pmulld xmm0, xmm1

	pop ebp
	ret
_mul_at_once ENDP

END