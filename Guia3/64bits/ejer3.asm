GLOBAL sys_write

ALIGN 4
sys_write:
	push rbp
	mov ebp, esp
	
	push rsp
	push rbx
	push rax
	push r12
	push r13
	push r15

	mov rax, 0x1
	mov rdi, [ebp+8] 	;fd
	mov rsi, [ebp+12]	;buffer
	mov rdx, [ebp+16] 	;length
	syscall
	
	pop rsp
	pop rbx
	pop rax
	pop r12
	pop r13
	pop r15
	
	mov esp, ebp
	pop rbp
	ret