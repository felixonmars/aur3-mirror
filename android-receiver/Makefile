OUT = android-receiver

SRC = $(OUT).c
OBJ = $(SRC:.c=.o)

PREFIX ?= /usr/local

CFLAGS := -std=c99 -g -pedantic -Wall -Wextra $(CFLAGS)

all: $(OUT)

$(OUT): $(OBJ)
	$(CC) -o $@ $(OBJ) $(LDFLAGS)

install: all
	install -D -m755 $(OUT) $(DESTDIR)$(PREFIX)/bin/$(OUT)

clean:
	$(RM) $(OUT) $(OBJ)

.PHONY: install clean
