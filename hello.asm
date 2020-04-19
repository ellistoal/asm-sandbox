%include "syscall.asm"

section .data
    mommy db "mommy pancake",10, 0
    fortnite db "fortnite dances",10, 0

section .text
global _start

extern printhello
extern log_arguments

_start:
    call log_arguments
    call printhello
    sys_exit 0

printhello:
    mov rax, mommy
    sys_write_stdout

    mov rax, fortnite
    sys_write_stderr
    ret