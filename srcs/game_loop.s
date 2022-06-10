bits 64

section .text
	global	game_loop
	extern	array
	extern	read_loop

game_loop:
	;prologue
	push	rbp
	mov		rbp, rsp

	mov		rbx, 2		;holder du player_nb

check_before_loop:
	cmp		rbx, 2
	je		change_rbx_1
	jmp		change_rbx_2

loop:
	;fonction qui check l'imput et qui renvoie la colone
	mov		rdi, rbx
	push	rbx
	call	read_loop
	pop		rbx
	;fonction qui ecrit le jeton dans l'array et sur l'ecran

	;fonction qui check si un joueur a gagne (exit 0 dedans?)
	
	;retourne au debut de la loop
	jmp		check_before_loop


change_rbx_1:
	mov		rbx, 1
	jmp		loop

change_rbx_2:
	mov		rbx, 2
	jmp		loop