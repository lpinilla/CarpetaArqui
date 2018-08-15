section .text
global _start

EXTERN ejer3
EXTERN print
EXTERN exit

_start:
	
	pushf
	pusha
	mov eax, 0
	mov ecx, 0
	mov edx, 0
	mov ebx, array
							;A: contador de posiciones y longitud (maneja el ciclo externo)
							;D: el valor más chico
							;C: el índice del valor más chico y el contador del loop
	mov ah, longitud

	.loop:					;i
	cmp ah, al
	je .print
	call .findmin			;guarda el minimo en registro c

	.findmin:				;k
	mov cl, al 				;hay que arrancar desde el i-esimo numero

	push ebx
	mov ch, 0
	add ebx, ecx 			;mover el puntero
	mov dl, [ebx]			;guardar el i-esimo numero
	pop ebx
	inc cl

	.minloop:				;recorrer desde i+1 hasta n los numeros
	cmp cl, ah
	je .swapmin				;acá el mínimo esta guardado en dl	

	push ebx
	push ecx
	mov ch, 0
	add ebx, ecx
	pop ecx
	mov dh, [ebx]			;cargamos el k-esimo valor, estoy pisando el índice del mas chico
	pop ebx

	cmp dl, dh
	ja .swap	
	inc cl
	jmp .minloop

	.swap:
	mov dl, dh				;agarramos el valor más chico
	mov ch, cl 				;agarramos su índice
	inc cl
	jmp .minloop

	.swapmin: 				
	;falta una condicion para que salga si el minimo ya esta en su lugar
	;si array[al] == dl -> no hay swap

	mov ebx, array 			;recuperamos el puntero a la posicion original
	push eax
	mov ah, 0
	push ebx
	add ebx, eax
	mov dh, [ebx]
	pop ebx
	pop eax
	cmp dh, dl
	je .noswap


	

	push eax				;guardamos en dh el valor array[al]
	mov ah, 0
	add ebx, eax
	mov dh, [ebx]
	pop eax

	mov ebx, array 			;guardmaos el valor dh en array[ch]
	push ecx
	mov cl, ch
	mov ch, 0
	add ebx, ecx
	mov [ebx], dh
	pop ecx

	mov ebx, array 			;guardamos el valor dl en array[al]
	push eax
	mov ah, 0
	add ebx, eax
	mov [ebx], dl
	pop eax

	mov ebx, array
	inc al
	jmp .loop

	.noswap:
	mov ebx, array
	inc al
	jmp .loop

	.print:					
	mov al, 0
	;dec ah
	.printloop:
	mov ebx, array
	cmp ah, al
	je .end

	push ebx
	push eax

	mov ah, 0
	add ebx, eax
	mov al, [ebx]
	mov ebx, smallest
	call ejer3
	call print

	pop eax
	pop ebx
	inc al
	jmp .printloop

	.end:
	popa
	popf
	call exit

section .data
array db 4,3,2,1
longitud equ $-array
smallest db "a", 10, 0

section .bss
placeholder resb 20