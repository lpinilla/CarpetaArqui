;ejemplo.s
extern printf
global main
main:
	push	ebp
	mov	ebp, esp
	;STACK FRAME

	and	esp, -16
	;ALINEAMINTO


	sub	esp, 32 				;4 variables, char[4]?
	mov	DWORD  [esp+19], 1819043176 
	mov	DWORD  [esp+23], 1870078063
	mov	DWORD  [esp+27], 174353522
	mov	BYTE  [esp+31], 0
								;fin variables 			
	lea	eax, [esp+19]			;eax apunta al ultio elemento del vector de los esp
	mov	DWORD  [esp], eax 		;push &variables[3]
	call	magia				;magia(vector)


	lea	eax, [esp+19]			;eax = esp+19
	mov	DWORD  [esp], eax	;push eax
	call	printf

	;exit
	mov	eax, 0
	leave

magia:
	push	ebp
	mov	ebp, esp
	;stack frame

	sub	esp, 16

	jmp	.L4
.L6:
	mov	eax, DWORD  [ebp+8]
	movzx	eax, BYTE  [eax]
	cmp	al, 96
	jle	.L5
	mov	eax, DWORD  [ebp+8]
	movzx	eax, BYTE  [eax]
	cmp	al, 122
	jg	.L5
	mov	eax, DWORD  [ebp+8]
	movzx	eax, BYTE  [eax]
	mov	BYTE  [ebp-1], al
	movzx	eax, BYTE  [ebp-1]
	sub	eax, 32
	mov	BYTE  [ebp-1], al
	mov	eax, DWORD  [ebp+8]
	movzx	edx, BYTE  [ebp-1]
	mov	BYTE  [eax], dl
.L5:
	add	DWORD  [ebp+8], 1
.L4:
	mov	eax, DWORD  [ebp+8]		;dirección del 1er argumento de la función
	movzx	eax, BYTE  [eax] 	;eax = *eax 32 bits
	test	al, al 				;testear (un and) al con el mismo para cambiar los flags
	jne	.L6						;jmp if al != al -> if zero flag == 0
	leave
	ret