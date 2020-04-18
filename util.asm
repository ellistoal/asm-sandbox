%include "syscall.asm"

section .data
    mommy db "mommy pancake",10
    fortnite db "fortnite dances",10
    
section .text

global printhello

printhello:
    sys_write_stdout mommy, 14
    sys_write_stdout fortnite, 16
    ret