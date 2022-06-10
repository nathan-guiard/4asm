bits 64

section .text
	global	colone_len
	extern	array

colone_len:
	;prologue
	push	rbp
	mov		rbp, rsp

	mov		al, byte[array]
	

end_colone_len:
	;epilogue
	mov		rsp, rbp
	pop		rbp
	and		rax, 0x000000ff
	ret