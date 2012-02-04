CC=gcc
RM=rm

CFLAGS=-g -O2 --std=c99 -Wall
AITOOLS=-I/usr/include/aitools -L/usr/include/aitools -laitools
RMFLAGS=-rf

build :
	@#echo CC cookie.c
	$(CC) $(CFLAGS) cookie.c -o cookie $(AITOOLS)

clean :
	@echo RM cookie
	@$(RM) $(RMFLAGS) cookie

install :
	install -m 755 cookie /usr/bin/cookie
	chmod +x /usr/bin/cookie

uninstall :
	rm -rf /usr/bin/cookie
