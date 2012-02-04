CC=gcc
LD=gcc
AR=ar
RM=rm

CFLAGS=-g -O2 --std=c99 -Wall -I.
LDFLAGS=-g -O2 --std=c99 -Wall -I. -L.
ARFLAGS=rcs
RMFLAGS=-rf

PREFIX=/usr

build :
	@echo CC aitools.c
	@$(CC) $(CFLAGS) -c aitools.c
	@echo LD ai
	@$(RM) $(RMFLAGS) ai.o
	@$(LD) $(LDFLAGS) $(CFLAGS) ai.c aitools.o -o ai
	@echo AR aitools.o
	@$(AR) $(ARFLAGS) libaitools.a aitools.o

install :
	mkdir -p $(PREFIX)/include/aitools
	@echo
	install aitools.h $(PREFIX)/include/aitools/aitools.h
	@echo
	install libaitools.a $(PREFIX)/include/aitools/libaitools.a
	@echo
	@echo "Compile with -I$(PREFIX)/include/aitools"
	@echo "Put #include <aitools.h> in your source files"
	@echo "Link with -L$(PREFIX)/lib/aitools -laitools"

uninstall :
	$(RM) $(RMFLAGS) $(PREFIX)/include/aitools

clean :
	@echo RM *.o *.a ai ai.log test.atpkg
	@$(RM) $(RMFLAGS) *.o *.a ai ai.log test.atpkg
