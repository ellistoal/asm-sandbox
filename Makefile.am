NASM = /usr/bin/nasm
LD   = /usr/bin/ld

bin_PROGRAMS = hello$(EXEEXT)
hello_SOURCES = hello.asm util.asm
hello_OBJS = hello.o util.o
hello_NASMFLAGS = @PACKAGE_NASMFLAGS@
hello_LDFLAGS = @PACKAGE_LDFLAGS@

.asm.o:
	$(NASM) $(hello_NASMFLAGS) $< -o $@

hello$(EXEEXT): $(hello_OBJS) 
	$(LD) $(LDFLAGS) $^ -o $@

clean:
	rm -rf $(hello_OBJS) $(bin_PROGRAMS)
