section .text
global _start

EXTERN print
EXTERN ejer3
EXTERN exit

_start:

	;no tiene stack frame

	pushf							;guardamos los flags que tenía
	pusha
	mov eax, 0 						;limpiamos el registro a
	mov al, 2						;n
	mov ah, 10						;k
	mov ecx, 0						;limpiar el registro c
	mov ebx, numberholder
	inc ah 							;hardcodeo para no tener en cuenta n=k

	.loop:							
	cmp cl, ah
	je .end
									;swappear los registros para dividir
	push eax
	mov eax, ecx
	pop ecx

	push eax						;guardar el numero por si es multiplo
	div cl
	cmp ah, 0
	je .writenumber					;condicion: si el resto da 0
									;volver a swappear los registros luego de dividir
	push eax
	mov eax, ecx
	pop ecx

	pop ecx							;restaurar el numero
	inc cl
	jmp .loop


	.writenumber:
	call ejer3
	jmp .printnumber

	.printnumber:
	call print

	push eax						;swappear y volver al ciclo
	mov eax, ecx
	pop ecx

	pop ecx
	inc cl 							;y hacer lo que se hace si no se entra al ciclo
	jmp .loop

	.end:
	popa
	popf
	call exit


section .data
numberholder db "0000", 10, 0

section .bss
placeholder resb 20