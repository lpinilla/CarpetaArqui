section .text
global _start

EXTERN ejer3
EXTERN print
EXTERN exit


_start:
	mov al, 3
	mov ebx, space
	call ejer3 
	call print
	call exit




section .data
	space db 'a', 0, 10

section .bss
	placeholder resb 20
