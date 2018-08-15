section .text
global _start

EXTERN ejer3
EXTERN print
EXTERN exit

_start:		 						;imprime el factorial de un numero que recibe en al

	.stackframe:
	push ebp
	mov ebp, esp

	.init:
	pushf
	pusha
	mov eax, 0
	mov ebx, string
	mov edx, 1 						;el minimo factorial es 1
	mov al, 3 						;el numero
	push eax						;guardamos el numero original

	.loop: 							;cortamos en 1 para ahorrarnos pensar con el 0
	cmp al, 1
	jz .printnumber

	push eax						;swappeamos los registros
	mov eax, edx
	pop edx

	mul dl
	dec dl							;decrementamos el contador

	push eax						;swappeamos los registros
	mov eax, edx
	pop edx

	jmp .loop	



	.printnumber:
	push eax						;swappeamos los registros
	mov eax, edx
	pop edx	
	call ejer3
	call print
	push eax						;swappeamos los registros
	mov eax, edx
	pop edx	



	.deinit:
	pop eax
	mov ah, cl
	popa
	popf
	call exit



section .data
string db "ab", 10, 0

section .bss
placeholder resb 20