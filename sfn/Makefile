all: dmd

dmd:
	dmd sfn.d -ofsfn -O -w -wi

gdc:
	gdc sfn.d -o sfn -O2 -Wall
	
install:
	install -d ${DESTDIR}/usr/bin/
	install sfn ${DESTDIR}/usr/bin/

clean:
	rm -f sfn sfn.o
