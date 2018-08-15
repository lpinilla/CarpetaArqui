section .text
global _start

EXTERN ejer3
EXTERN print
EXTERN exit


_start:
	mov eax, 0x 	;clear ax register
	mov al, 0
	mov ebx, space
	call ejer3 
	call print
	call exit




section .data
	space db 'ab', 10, 0

section .bss
	placeholder resb 20
