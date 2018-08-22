section .text

global _start

_start:




section .data
string db "echo 22"
longitud equ $-string
section .bss