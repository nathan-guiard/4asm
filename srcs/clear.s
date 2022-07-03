bits 64

section .data
	clear_mes db 0x1b, "[0", 0x3b, "0H", 0x1b, "[0J"
	clear_len equ $ - clear_mes

section .text
	global	clear

clear:
	;prologue
	push	rbp
	mov		rbp, rsp

	push	rax
	push	rdi
	push	rsi
	push	rdx

	mov		rax, 1
	mov		rdi, 1
	mov		rsi, clear_mes
	mov		rdx, clear_len
	syscall

	pop	rdx
	pop	rsi
	pop	rdi
	pop	rax

	;epilogue
	mov		rsp, rbp
	pop		rbp
	ret