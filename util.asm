%include "syscall.asm"

section .data
    mommy db "mommy pancake",10
    fortnite db "fortnite dances",10
    
section .text

global printhello

printhello:
    ; making sys call to sys_write
    mov rax, SYS_WRITE
    mov rdi, 1
    mov rsi, mommy
    mov rdx, 14
    syscall

    ; making sys call to sys_write
    mov rax, SYS_WRITE
    mov rdi, 1
    mov rsi, fortnite
    mov rdx, 16
    syscall
    ret
