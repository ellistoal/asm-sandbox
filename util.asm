section .data
    text db "mommy pancake",10
    
section .text

global printhello

printhello:
    ; making sys call to sys_write
    mov rax, 1
    mov rdi, 1
    mov rsi, text
    mov rdx, 14
    syscall
    ret
