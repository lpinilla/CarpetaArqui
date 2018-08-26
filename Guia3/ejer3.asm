section .text
ALIGN 4
global sys_write

	sys_write:
	push ebp
	mov ebp, esp

	push ebx
	mov eax, 0x4
	mov ebx, [ebp+8]	;file descriptor
	mov ecx, [ebp+12] 	;buffer
	mov edx, [ebp+16]	;length
	int 0x80

	pop ebx

	mov esp, ebp
	pop ebp
	ret

section .data


section .bss
placeholder resb 20