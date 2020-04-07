section .data
    text db "mommy pancake",10
    
section .text
global _start

extern printhello

_start:
    mov rbp, rsp; for correct debugging
    call printhello
    
    call exit
    
exit:
    ; making sys call to sys_exit
    mov rax, 60
    mov rdi, 0
    syscall
