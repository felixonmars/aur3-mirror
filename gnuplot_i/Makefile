

CC 		= gcc
CFLAGS 	= -O3 -I./src
RM		= rm -f

lib:
	gcc -fpic -shared src/gnuplot_i.c -olibgnuploti.so

tests:		test/anim test/example test/sinepng

test/anim:	test/anim.c 
	$(CC) $(CFLAGS) -o $@ $@.c -lgnuploti -I. -L.

test/example:	test/example.c gnuplot_i.o
	$(CC) $(CFLAGS) -o $@ $@.c -lgnuploti -I. -L.

test/sinepng:	test/sinepng.c gnuplot_i.o
	$(CC) $(CFLAGS) -o $@ $@.c -lgnuploti -I. -L.

clean:
	$(RM) gnuplot_i.o test/anim test/example test/sinepng libgnuplot_i.so

