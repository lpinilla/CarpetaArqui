section .text
global _start

EXTERN print
EXTERN ejer3
EXTERN exit

_start:

	pushf							;guardamos los flags que tenía
	pusha
	mov eax, 0 						;limpiamos el registro a
	mov al, 2						;n
	mov ah, 10						;k
	mov ecx, 0						;limpiar el registro c
	mov ebx, numberholder

	.loop:							;loop infinito
	cmp cl, ah
	je .end
	push eax
	mov ch, al 						;swap cl con al
	mov al, cl
	mov cl, ch
	mov ch, ah
	mov ah, 0
	div cl
	cmp ah, 0
	je .writenumber					;condicion: si el resto da 0
	pop eax
	inc cl
	jmp .loop


	.writenumber:
	push eax
	mov eax, ecx					;pasamos el valor a imprimir
	call ejer3
	pop eax	
	jmp .printnumber

	.printnumber:
	call print
	pop eax 						;como se sale del ciclo, tiene que volver
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