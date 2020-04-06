%include "io64.inc"

section .data
    text db "mommy pancake",10
    
section .text
global CMAIN

CMAIN:
    mov r8, 0
    
DOTHIS:
    add r8, 1
    
    ; making sys call to sys_write
    mov rax, 1
    mov rdi, 1
    mov rsi, text
    mov rdx, 14
    syscall
    
    cmp r8, 10

    jl DOTHIS
        
    ; making sys call to sys_exit
    mov rax, 60
    mov rdi, 0
    syscall 