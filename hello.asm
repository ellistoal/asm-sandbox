%include "syscall.asm"

section .data
    mommy db "mommy pancake",10, 0
    fortnite db "fortnite dances",10, 0

section .text
global _start

extern printhello

_start:
    call printhello
    sys_exit 0