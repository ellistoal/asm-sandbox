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

; Attempts to write nbyte (param 2) of data to the object
; refernced to stdout from the buffer pointed to by param 1.
; param 1 - byte buffer
; param 2 - length to display
;
; TODO figure out size dynamically
%macro sys_write_stdout 2
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, %1
    mov rdx, %2
    syscall
%endmacro