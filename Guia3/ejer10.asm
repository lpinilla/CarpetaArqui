global main
extern printf

section .text

main:

	push ebp
	mov ebp, esp
	mov eax, 0h
	cpuid

	mov [placeholder], ebx
	mov [placeholder +4], edx
	mov [placeholder + 8], ecx
	push placeholder
	push fmt
	call printf
	mov eax, 0
	leave
	ret

section .data
fmt db "Empresa: %s", 10, 0

section .bss
placeholder resb 20