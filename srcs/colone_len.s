bits 64

section .text
	global	colone_len
	extern	array

	;rbx = col_nb
colone_len:
	;prologue
	push	rbp
	mov		rbp, rsp

	xor		rax, rax
	dec		rbx
	mov		rax, rbx
	mov		rcx, 7
	mul		rcx
	mov		rcx, array	
	add		rcx, rax		;array += 7 * col_nb
	jmp		loop_col_len

loop_col_len:
	mov		dl, byte[rcx]
	cmp		dl, 0
	je		end_colone_len
	inc		rax
	inc		rcx
	cmp		rax, 7
	je		end_colone_len
	jmp		loop_col_len


end_colone_len:
	;epilogue
	mov		rsp, rbp
	pop		rbp
	and		rax, 0x000000ff
	ret