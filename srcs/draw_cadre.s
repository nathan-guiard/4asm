bits 64

section .data
	cadre db "| | | | | | | |", 0xa
	len_cadre equ $ - cadre

section .text
	global	draw_cadre
	extern	clear

draw_cadre:
	;prologue
	push	rbp
	mov		rbp, rsp

	;init
	mov		rax, 0	;rax -> i = 0
	call	clear
	jmp		loop_draw_cadre

loop_draw_cadre:
	cmp		rax, 7
	je		end
	inc		rax
	push	rax				;envoie rax dans la stack pour l'avoir apres
	mov		rax, 1			;write
	mov		rdi, 1
	mov		rsi, cadre
	mov		rdx, len_cadre
	syscall
	pop		rax				;reprend rax
	jmp		loop_draw_cadre

end:
	;epilogue
	mov		rsp, rbp
	pop		rbp
	ret	