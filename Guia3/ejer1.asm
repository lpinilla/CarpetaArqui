;main.asm
GLOBAL main
EXTERN printf
ALIGN 4

section .rodata
fmt db "Cantidad de argumentos: %d", 10, 0
fmt2 db "Argumento: %s", 10, 0

section .text
main:
        push ebp      ; Armado de stack frame
        mov ebp, esp  ;

        push ebx
        				;preservar el stack
        push eax
        push ebx
        push edx
        pushf


        push dword [ebp+8]
        push fmt
        call printf

        add esp, 2*4 	;para no popear 2 veces

        				;cargar el stack anterior
        popf
        pop edx
        pop ebx
        pop eax
        				;empezamos a armar el ciclo
	
        mov ecx, [ebp+8]
        mov ebx, [ebp+12]               ;guardar en ebx donde empieza el vector
        dec ecx

        .loop:
        cmp ecx, 0
        je .restoreandexit
						;preservar el stack
        push eax
        push ebx
        push edx
        pushf

        add ebx, 4
        push dword [ebx]
        push fmt2

        call printf
        add esp, 2*4
        				;cargar el stack anterior
        popf
        pop edx
        pop ebx
        pop eax

        jmp .loop

        .restoreandexit:
        pop ebx
        mov eax, 0		;exit code
        
        mov esp, ebp  ; Desarmado de stack frame
        pop ebp
        ret