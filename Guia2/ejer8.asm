section .text
global _start

_start:
	
	pushf
	pusha
	mov eax, 0
	mov ecx, 0
	mov ebx, array
	mov ah, longitud

	.loop:
	cmp ah, cl
	je .print

	.findmin				;guarda el minimo en smallest




	popa
	popf

section .data
array db 4,3,2,1
longitud equ $-array-1
smallest db "a", 10, 0

section .bss
placeholder resb 20