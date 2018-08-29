global main
extern openfile
extern read
extern write
extern closeprogram

section .text

	push ebp
	mov ebp, esp

	



	leave
	ret

section .data
filepath "test",0


section .bss
placeholder resb 20