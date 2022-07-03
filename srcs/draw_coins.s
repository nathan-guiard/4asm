bits 64

section .data
	printf_mes db ""


section .text
	global draw_coins

draw_coins:
	call	clear