section .text

global _start

EXTERN ejer3
EXTERN print
EXTERN exit


_start:
	mov ebp, esp
	mov eax, [ebp]
	mov ebx, holder
	call ejer3
	call print
	call exit



section .data
holder db "a", 10, 0
section .bss
placeholder resb 20