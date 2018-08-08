section .text
global main
main:
	mov edx, longitud	;largo de la cadena
	mov ecx, cadena		;puntero a la cadena
	mov ebx, 1 			;FD del standar output ??
	mov eax, 4			;ID del system call WRITE
	int 80h
	mov eax, 1			;terminar la ejecucion
	int 80h

section .data
	cadena db "Hola mundo", 10, "$"
	longitud equ $-cadena

section .bss
placeholder resb 20