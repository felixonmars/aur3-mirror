TARGET=$(shell basename `pwd`)
SOURCES=$(wildcard *.vala)

all:
	valac $(SOURCES) --pkg gee-0.8 --pkg gtk+-3.0 -X -lm -o populate

clean:
	rm -f populate

install:
	cp -f populate /usr/bin

uninstall:
	rm -f /usr/bin/populate
