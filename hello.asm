%include "syscall.asm"

section .text
global _start

extern printhello

_start:
    call printhello
    sys_exit 0