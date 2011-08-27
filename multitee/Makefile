PREFIX = /usr/local
MANPREFIX = ${PREFIX}/share/man

CFLAGS = -Os

CC = cc

SRC = multitee.c sigdfl.c sigsched.c ralloc.c getopt.c fmt.c scan.c
OBJ = ${SRC:.c=.o}

all: ${OBJ}
	${CC} -o multitee ${OBJ}

.c.o:
	${CC} -c ${CFLAGS} $<

install: all
	install -Dm0755 multitee ${DESTDIR}${PREFIX}/bin/multitee
	install -Dm0644 multitee.1 ${DESTDIR}${MANPREFIX}/man1/multitee.1

