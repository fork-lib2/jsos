CFLAGS=-m32 -Wall -Wextra -iquote inc -g -Wno-unused-parameter -nostdlib \
		-nostdinc -fno-builtin -nostartfiles -nodefaultlibs -fno-exceptions \
		-fno-stack-protector -I./libc/inc -I./vm/inc

LDFLAGS=-nostdlib -static

userland: libc/libc.a vm/libjsvm.a userland.o
	ld -o userland $(LDFLAGS) libc/src/*.o vm/src/*.o vm/src/*/*.o userland.o

libc/libc.a:
	make -C libc libc.a

vm/libjsvm.a:
	make -C vm libjsvm.a

clean:
	rm -f userland
	rm -f *.o
	make -C libc clean
	make -C vm clean