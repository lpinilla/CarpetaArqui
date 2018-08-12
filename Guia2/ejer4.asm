section .text
global _start

EXTERN ejer3
EXTERN print
EXTERN exit

;recieve number in eax and puts the sum from 0 to n in ebx

_start:
	
	mov eax, 0			;clear eax
	mov al, 5			;el numero

	push eax 			;guardar el numero original
	push ebx 			;guardamos lo que había

	mov ebx, 0

	.loop:
	cmp al, 0
	je .numbertostring 	;condicion de corte
	add ebx, eax
	dec eax
	jmp .loop
						;resultado guardado en ebx
	.numbertostring:
	push eax
	push ebx
	mov eax, ebx
	mov ebx, result
	call ejer3	
	.break:
	call print
	pop ebx
	pop eax
	.end:	
	pop ebx
	pop eax
	call exit


section .data
result db "22", 10, 0

section .bss			
placeholder resb 20