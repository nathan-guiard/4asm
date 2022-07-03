bits 64

section .text
	extern	array
	extern	colone_len
	global	put_token
	extern	put_in_array


	;rdi:	player_nb
	;rsi:	colone
put_token:
	;prologue
	push	rbp
	mov		rbp, rsp

	push	rdi
	push	rsi
	mov		rbx, rsi
	call	colone_len
	pop		rsi
	pop		rdi

	push	rdi
	push	rsi
	mov		rdx, rax
	call	put_in_array


end_put_token:
	;epilogue
	mov		rsp, rbp
	pop		rbp
	ret	