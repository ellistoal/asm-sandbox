%include "syscall.asm"

section .text
global _start

extern printhello

_start:
    call printhello
    call exit
    
exit:
    ; making sys call to sys_exit
    mov rax, SYS_EXIT
    mov rdi, 0
    syscall
