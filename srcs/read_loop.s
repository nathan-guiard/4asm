bits 64

section .data
	colone db "Veuillez entrer un chiffre de 1 a 7.", 0xa
	colone_len equ $ - colone
	player_1 db "Joueur 1:", 0xa
	msg1_len equ $ - player_1
	player_2 db "Joueur 2:", 0xa
	msg2_len equ $ - player_2
	input_error db "Erreur d'input", 0xa
	error_len equ $ - input_error
	input db 2

section .text
	global	read_loop

read_loop:
	;prologue
	push	rbp
	mov		rbp, rsp

	mov		rbx, rdi	;rbx = player_nb
	;push	rbx

	;write (1, colone, colone_len)
	mov		rax, 1
	mov		rdi, 1
	mov		rsi, colone
	mov		rdx, colone_len
	syscall

read:
	;read (0, input, 1)
	mov		rax, 0
	mov		rdi, 0
	mov		rsi, input
	mov		rdx, 2
	syscall

	; if (input[0] > '7' || input[0] < '1') -> error
	cmp		byte [input], 49
	jl		error
	cmp		byte [input], 56
	jg		error

	jmp		end_read_loop

error:
	mov		rax, 1
	mov		rdi, 1
	mov		rsi, input_error
	mov		rdx, error_len
	syscall
	jmp		read

end_read_loop:
	;epilogue
	sub		byte [input], 48
	mov		al, byte [input]
	and		rax, 0x000000ff
	mov		rsp, rbp
	pop		rbp
	ret