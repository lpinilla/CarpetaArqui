section .text
global _start

EXTERN ejer3
EXTERN print
EXTERN exit

_start:

	.init:
	push ebp
	mov ebp, esp
	pusha
	pushf
	mov eax, 0
	mov ah, longitud		;cant iteraciones
	mov ebx, array
	mov ecx, 1 				;que arranque en 1

	mov al, [array]			;el primer valor

	.loop:
	cmp cl, ah
	je .printsmallest
	push ebx
	add ebx, ecx 			;mover el puntero
	mov ch, [ebx]
	pop ebx
	cmp al, ch				;comparar el anterior con el siguiente
	ja .swapmin
	mov ch, 0
	inc cl
	jmp .loop

	.swapmin:
	mov al, ch
	mov ch, 0
	inc cl
	jmp .loop


	.printsmallest:
	mov ebx, smallest
	call ejer3
	call print

	.deinit:
	popf
	popa
	pop ebp
	call exit



section .data
array db 3, 7, 1, 8
longitud equ $-array-1
smallest db "a", 10, 0

section .bss
placeholder resb 20