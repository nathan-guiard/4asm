bits 64

section .text
	extern	array
	global	put_in_array

	;rdi:	player_nb
	;rsi:	colone
	;rdx:	col_len
put_in_array:
	;prologue
	push	rbp
	mov		rbp, rsp

	dec		rsi
	mov		rax, rsi
	mov		rcx, 7
	mul		rcx
	add		rax, rdx
	add		rax, array
	mov		[rax], dil

	;epilogue
	mov		rsp, rbp
	pop		rbp
	ret