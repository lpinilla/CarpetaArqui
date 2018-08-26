global openfile
global read
global write
global closeprogram

section .text

;-----------------------------------------------------------
; write - excribe en el File Descriptor indicado
;-----------------------------------------------------------
; Argumentos:
;	write(int fileDescriptor, void * buffer, int size)
;-----------------------------------------------------------

write:
	push ebp
	mov ebp, esp

	push ebx
	mov eax, 0x4
	mov ebx, [ebp+8]	;file descriptor
	mov ecx, [ebp+12] 	;buffer
	mov edx, [ebp+16]	;length
	int 0x80

	pop ebx

	leave
	ret

;-----------------------------------------------------------
; read - lee de un File Descriptor
;-----------------------------------------------------------
; Argumentos:
;	read(int fileDescriptor, void * buffer, int nOfLetters)
;-----------------------------------------------------------

read:
	push ebp
	mov ebp, esp

	push ebx
	mov eax, 0x3
	mov ebx, [ebp +8]
	mov ecx, [ebp +12]
	mov edx, [ebp + 16]
	int 0x80

	pop ebx
	leave
	ret

;----------------------------------------------------------------------
; openFile - abre un archivo
;----------------------------------------------------------------------
; Argumentos:
;	int open(const char *pathname, int flags, int mode)
;-----------------------------------------------------------------------

openFile:
	push ebp
	mov ebp, esp

	push ebx
	mov eax, 0x5
	mov ebx, [ebp +8]
	mov ecx, [ebp +12] 		
	mov edx, [ebp + 16]
	int 0x80

	pop ebx
	leave
	ret

;----------------------------------------------------------------------
; closeProgram - abre un archivo
;----------------------------------------------------------------------
; Argumentos:
;	int close(int fd)
;-----------------------------------------------------------------------

openFile:
	push ebp
	mov ebp, esp

	push ebx
	mov eax, 0x6
	mov ebx, [ebp +8]
	int 0x80

	pop ebx
	leave
	ret
