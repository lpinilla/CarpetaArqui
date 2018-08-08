section .text
global main

main:

	
																;convertir el string
																;para convertir en mayuscula, hay que restarle X cant si es una letra
																;es una letra si esta entre ascii(a) y ascii(z)

																
	mov cl, 0													;inicializar un contador
	mov ebx, string												;guardamos la posición en donde comienza el array

	ciclo:
																;verificar que no nos hayamos pasado de la longitud de la palabra
		inc cl 													;hay que sumarle 1 por el '\n'
		cmp cl, longitud										
		jz printandexit 										;si son iguales, ya recorrimos todo el array
		dec cl  												;recuperamos el valor que tenía

																
																;levantar el i-esimo caracter				
		inc ebx													;movemos la dirección a la que apuntamos del arreglo
		mov dl, [ebx-1]			 								;acceder a la dirección que guarda al
		inc cl 													;incrementar el contador
																;el caracter esta en dl, hay que ver si es una letra minuscula
		mov al, dl 												;guardamos el valor porque vamos a jugar con el un poquito
		sub dl, aminusc
		jnge ciclo 												;jump not greater or equal (que levante la próxima letra)
		mov dl, al 												;recuperamos el valor original
		mov al, dl 												;lo volvemos a guardar
		sub dl, zminusc
		jg ciclo 												;jump if greater
		mov dl, al												;si no pasa nada de esto, es una letra minuscula
																;convertimos a mayusc y volvemos al ciclo
		sub dl, [decrement]
		mov [ebx-1], dl
		jmp ciclo

	printandexit:
		mov eax, 4
		mov edx, longitud
		mov ecx, string
		mov ebx, 1
		int 80h
		mov eax, 1
		int 80h


section .data
	string db "h4ppy c0d1ng", 10, "$"
	longitud equ $-string
	aminusc equ 61h 											;'a'
	zminusc equ 7Ah 											;'z'
	decrement db 20h											;diferencia entre mayusc y minusc	

section .bss													;ni idea que es esto
	placeholder resb 20