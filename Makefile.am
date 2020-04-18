LD   = /usr/bin/ld

if OSX
NASM = /usr/local/bin/nasm
LD_FLAGS= -lSystem -e _start
NASMFLAGS=-f macho64
else
NASM = /usr/bin/nasm
LD_FLAGS= --nmagic -m elf_i386 --script=os.lds
NASMFLAGS= -f elf64 -F dwarf -g -w+all
endif

bin_PROGRAMS = hello$(EXEEXT)
hello_SOURCES = syscall.asm util.asm hello.asm 
hello_OBJS = hello.o util.o syscall.o

.asm.o: $(hellow_SOURCES)
	$(NASM) $(NASMFLAGS) $^ -o $@

hello$(EXEEXT): $(hello_OBJS) 
	$(LD) $(LD_FLAGS) $^ -o $@

clean:
	rm -rf $(hello_OBJS) $(bin_PROGRAMS)
