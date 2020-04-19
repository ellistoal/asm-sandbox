; Standard Streams
%define STDIN  0
%define STDOUT 1
%define STDERR 2

; OSX System Call ID's
%ifidn __OUTPUT_FORMAT__, macho64
%define SYS_EXIT  0x2000001
%define SYS_WRITE 0x2000004
%endif

; Linux System Call ID's
%ifidn __OUTPUT_FORMAT__, elf64 
%define SYS_EXIT  60
%define SYS_WRITE 1
%endif

; Calls system exit with the given parameter
; param 1 - exit code
%macro sys_exit 1 
    mov rax, SYS_EXIT
    mov rdi, %1
    syscall
%endmacro

; Attempts to write buffer (pointed to by rax - param 1) as ASCII string,
; terminated by 0x0 to stdout from the buffer pointed to by param 1.
%macro sys_write_stdout 0
    sys_write STDOUT
%endmacro

; Attempts to write buffer (pointed to by rax - param 1) as ASCII string,
; terminated by 0x0 to stderr from the buffer pointed to by param 1.
%macro sys_write_stderr 0
    sys_write STDERR
%endmacro

; Attempts to write buffer (pointed to by rax - param 1) as ASCII string,
; terminated by 0x0 to output stream provided in the first parameter.
%macro sys_write 1
%%print:
    push rax
    mov rbx, 0
%%printLoop:
    inc rax
    inc rbx
    mov cl, [rax]
    cmp cl, 0
    jne %%printLoop

    pop rsi
    mov rax, SYS_WRITE
    mov rdi, %1
    mov rsi, rsi
    mov rdx, rbx
    syscall
%endmacro