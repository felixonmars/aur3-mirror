CC=gcc
LIBS=-lacl

test-xattr: test-xattr.c
	${CC} -o test-xattr test-xattr.c ${LIBS}

all: test-xattr

clean:
	rm test-xattr 2> /dev/null || true

distclean: clean

install: all
	cp test-xattr ${DESTDIR}/
