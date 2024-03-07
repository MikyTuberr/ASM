.686
.XMM ; zezwolenie na asemblacjê rozkazów grupy SSE
.model flat

public _pm_jeden

.data 
	f_array dd 4 dup (1.0)

.code

_pm_jeden PROC
	 push ebp
	 mov ebp, esp
	 push esi


	 mov esi, [ebp+8] ; adres pierwszej tablicy

	 movups xmm5, [esi]

	 addsubps xmm5, f_array

	 movups [esi], xmm5
	 

	 pop esi
	 pop ebp
	 ret
_pm_jeden ENDP

END