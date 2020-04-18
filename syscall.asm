%ifidn __OUTPUT_FORMAT__, macho64
%define SYS_EXIT  0x2000001
%define SYS_WRITE 0x2000004
%endif

%ifidn __OUTPUT_FORMAT__, elf64 
%define SYS_EXIT  60
%define SYS_WRITE 1
%endif
