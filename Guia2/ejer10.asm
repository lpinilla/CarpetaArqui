section .text

global _start

EXTERN ejer3
EXTERN print
EXTERN exit


_start:
	;pushf
	;pusha
	;push ebp
	mov ebp, esp
	mov ecx, [ebp]
	mov ebx, dword [ebp+8]
	dec ecx
	mov eax, 2

	.loop:
	cmp cl,0
	je .end
	call print	
	push ebx
	mov ebx, holder
	call print
	pop ebx
	add ebx, eax
	dec ecx
	jmp .loop

	.end:
	;mov esp, ebp
	;pop ebp
	;popa
	;popf
	call exit



section .data
holder db 10, 0
section .bss
placeholder resb 20