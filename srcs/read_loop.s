bits 64

section .data
	colone db "Veuillez entrer un chiffre de 1 a 7.", 0xa
	colone_len equ $ - colone
	player_1 db "Joueur 1:", 0xa
	msg1_len equ $ - player_1
	player_2 db "Joueur 2:", 0xa
	msg2_len equ $ - player_2
	imput_error db "Erreur d'imput"
	error_len equ $ - imput_error
	imput db 2

section .text
	global	read_loop

read_loop:
	;prologue
	push	rbp
	mov		rbp, rsp

	mov		rbx, rdi	;rbx = player_nb
	push	rbx

	;write (1, colone, colone_len)
	mov		rax, 1
	mov		rdi, 1
	mov		rsi, colone
	mov		rdx, colone_len
	syscall

read:
	;read (0, imput, 1)
	mov		rax, 0
	mov		rdi, 0
	mov		rsi, imput
	mov		rdx, 2
	syscall

	cmp		byte [imput], 49
	

	mov		rax, 60
	mov		rdi, 0
	syscall

test:
	mov		rax, 60
	mov		rdi, 10
	syscall