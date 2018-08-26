section .text

global siete

	siete:
	push ebp
	mov ebp, esp

	mov eax,7
	leave
	ret

section .data

section .bss
placeholder resb 20