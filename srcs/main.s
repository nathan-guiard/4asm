bits 64

section .data
	array dd 49

section .text
	global	_start
	extern	draw_cadre
	extern	game_loop

_start:
	call	draw_cadre
	call	game_loop

	;return
	mov rax, 60
	mov rdi, 0
	syscall