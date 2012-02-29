all: blocksort.o huffman.o crctable.o randtable.o bzlibfill.o
	gcc -W -Wall bz2module.c  -shared -fPIC -o bz2.so -I/usr/include/python2.7 decompress.c blocksort.o huffman.o crctable.o randtable.o new.c bzlibfill.o
clean:
	rm -f bz2.so decompress.o blocksort.o huffman.o crctable.o randtable.o new.o bzlibfill.o
.c.o:
	gcc -W -Wall -c -fPIC ${CFLAGS} -o $@ $<
