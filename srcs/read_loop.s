bits 64

section .data
	colone db "Veuillez entrer un chiffre de 1 a 7.", 0xa
	col_len equ $ - colone
	player_1 db 0x1b, "[1", 0x3b, "33mJoueur 1:", 0x1b, "[m", 0xa
	msg1_len equ $ - player_1
	player_2 db 0x1b, "[1", 0x3b, "31mJoueur 2:", 0x1b, "[m", 0xa
	msg2_len equ $ - player_2
	input_error db "Veuillez entrer un seul chiffre, entre 1 et 7 inclus", 0xa
	error_len equ $ - input_error
	colone_error db "Colone pleine.", 0xa
	colone_err_len equ $ - colone_error
	input db 2

section .text
	global	read_loop
	extern	colone_len

read_loop:
	;prologue
	push	rbp
	mov		rbp, rsp
	
	push	rdi

	pop		rbx
	cmp		rbx, 1
	je		write_p1
	jmp		write_p2

write_p1:
	mov		rax, 1
	mov		rdi, 1
	mov		rsi, player_1
	mov		rdx, msg1_len
	syscall
	jmp		write_colone

write_p2:
	mov		rax, 1
	mov		rdi, 1
	mov		rsi, player_2
	mov		rdx, msg2_len
	syscall
	jmp		write_colone

write_colone:
	;write (1, colone, col_len)
	mov		rax, 1
	mov		rdi, 1
	mov		rsi, colone
	mov		rdx, col_len
	syscall

read:
	;read (0, input, 1)
	mov		rax, 0
	mov		rdi, 0
	mov		rsi, input
	mov		rdx, 2
	syscall
	sub		byte [input], 48
	mov		al, byte [input]
	and		rax, 0x000000ff

	; if (input[0] > '7' || input[0] < '1') -> error
	cmp		rax, 1
	jl		error_read_loop
	cmp		rax, 7
	jg		error_read_loop

	;si la ligne est pleine -> error custom
	push	rax
	mov		rdi, rax
	call	colone_len
	mov		rcx, rbx
	pop		r8
	cmp		rcx, 7
	je		error_col_len
	mov		rax, r8
	jmp		end_read_loop

error_col_len:
	mov		rax, 1
	mov		rdi, 1
	mov		rsi, colone_error
	mov		rdx, colone_err_len
	syscall

error_read_loop:
	mov		rax, 1
	mov		rdi, 1
	mov		rsi, input_error
	mov		rdx, error_len
	syscall
	jmp		read

end_read_loop:
	;epilogue
	mov		rsp, rbp
	pop		rbp
	ret