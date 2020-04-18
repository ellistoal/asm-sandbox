; nasm -f macho64 hello.asm -o hello.o
; ld -lSystem -o hello -e _start hello.o
%include "syscall.asm"

section .text
global _start

extern printhello

_start:
    mov rbp, rsp; for correct debugging
    call printhello
    
    call exit
    
exit:
    ; making sys call to sys_exit
    mov rax, SYS_EXIT
    mov rdi, 0
    syscall
