%include "io64.inc"

section .data
    text db "mommy pancake",10
    
section .text
global CMAIN

CMAIN:
    ; making sys call to sys_write
    mov rax, 1
    mov rdi, 1
    mov rsi, text
    mov rdx, 14
    syscall
    
    ; making sys call to sys_exit
    mov rax, 60
    mov rdi, 0
    syscall