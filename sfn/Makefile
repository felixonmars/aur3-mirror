all: dmd

dmd:
	dmd sfn.d -ofsfn -O -w -wi

gdc:
	gdc sfn.d -o sfn -O2 -Wall
	
install:
	install -D sfn ${DESTDIR}/usr/bin/sfn
	install -D sfn.1 ${DESTDIR}/usr/share/man/man1/sfn.1

clean:
	rm -f sfn sfn.o

man:
	ronn -r sfn.1.ronn
