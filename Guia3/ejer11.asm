global main
extern printf
section .text
main:

	push ebp
	mov ebp, esp

	mov eax, 3
	mov ebx, 0
	call fibonacci
	push eax
	push fmt
	call printf
	leave
	ret

fibonacci:
	cmp eax, 0
	je .end
	add ebx, eax
	dec eax
	call fibonacci

	.end:
	mov eax, ebx
	ret


section .data
fmt db "%d", 10, 0

section .bss
placeholder resb 20