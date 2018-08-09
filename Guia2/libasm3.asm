
GLOBAL print
GLOBAL exit
GLOBAL ejer3

section .text

;-----------------------------------------------------------
; print - imprimer una cadena en la salida estandar
;-----------------------------------------------------------
; Argumentos:
;	ebx: cadena a imprimer en pantalla, terminada con 0
;-----------------------------------------------------------
print:
	pusha		; hago backup de los registros

	call strlen
	mov ecx, ebx	; la cadena esta en ebx
	mov edx, eax	; en eax viene el largo de la cadena

	mov ebx, 1		; FileDescriptor (STDOUT)
	mov eax, 4		; ID del Syscall WRITE
	int 80h
	
	popa 		; restauro los registros
	ret	
	
;-----------------------------------------------------------
; exit - termina el programa
;-----------------------------------------------------------
; Argumentos:
;	ebx: valor de retorno al sistema operativo
;-----------------------------------------------------------
exit:
	mov eax, 1		; ID del Syscall EXIT
	int 80h			; Ejecucion de la llamada


;-----------------------------------------------------------
; exit - calcula la longitud de una cadena terminada con 0
;-----------------------------------------------------------
; Argumentos:
;	ebx: puntero a la cadena
; Retorno:
;	eax: largo de la cadena
;-----------------------------------------------------------
strlen:
	push ecx ; preservo ecx	
	push ebx ; preservo ebx
	pushf	 ; preservo los flags

	mov ecx, 0	; inicializo el contador en 0
.loop:			; etiqueta local a strlen
	mov al, [ebx] 	; traigo al registo AL el valor apuntado por ebx
	cmp al, 0	; lo comparo con 0 o NULL
	jz .fin 	; Si es cero, termino.
	inc ecx		; Incremento el contador
	inc ebx
	jmp .loop
.fin:				; etiqueta local a strlen
	mov eax, ecx	
	
	popf
	pop ebx ; restauro ebx	
	pop ecx ; restauro ecx
	ret
	

;-----------------------------------------------------------
; ejer3 - recibe un numero y una dirección de memoria y 
; convierte el string del número ahí
;-----------------------------------------------------------
; Argumentos:
;	ebx: puntero a la direccion de memoria
;	eax: el numero (en registro de 8 bits)
;-----------------------------------------------------------
ejer3:
	pushf				;guardar los flags
	push eax			;guardar el numero original
	mov dl, 10	
	mov dh, 30h			;la diferencia entre valor y representación de numero	
	mov ecx, 0 			;limpiar el registro para usarlo como 2 de 8

	.ciclo:	
	cmp eax, 0
	jz writeinmemory	;condicion de corte del ciclo
	div dl 				;asumo que guarda el resto de dividir eax con dl en ah
	add ah, dh 			;convertir el numero
	mov ch, ah	
	push ecx
	inc cl
	jmp ciclo

	.writeinmemory:
	cmp cl, 0 			;si se ingresó el 0, que vaya al exit
	jz end
						;desde aca se asume que hay un numero
	push ebx
	mov ch, 0
	add ebx, ecx 		;sumamos ebx con cl para mover el puntero
	mov [ebx], 0		;'0' terminated
	mov [ebx+1], 10h 	; insertar '\n'
	pop ebx 			;recuperamos el valor original de la direccion
	mov dl, cl 			;guardamos la cantidad total


	.loop:
	cmp dl, 0
	jz end

	pop ecx				;agarramos la letra y su posición
	push edx			;guardamos el indice del loop
	dec dl 				;tiene que arrancar de 0
	sub dl, cl 			;averiguamos en que indice esta la letra

	mov dh,0			;es para pushear ebx
	push ebx

	add ebx, edx		;movemos el puntero
	mov [ebx], ch 		;guardamos la letra

	pop ebx
	pop edx 			;recuperamos dl

	dec dl
	jmp loop

	.end:
	pop eax
	popf
	ret