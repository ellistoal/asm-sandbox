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


%macro sys_exit 1 
    mov rax, SYS_EXIT
    mov rdi, %1
    syscall
%endmacro