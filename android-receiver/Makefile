OUT = android-receiver

SRC = $(OUT).c
OBJ = $(SRC:.c=.o)

PREFIX ?= /usr/local

CFLAGS := -std=c99 -g -pedantic -Wall -Wextra $(CFLAGS)

CFLAGS  += `pkg-config --cflags libnotify`
LDFLAGS += `pkg-config --libs libnotify`

all: $(OUT)

$(OUT): $(OBJ)
	$(CC) -o $@ $(OBJ) $(LDFLAGS)

install: all
	install -D -m755 $(OUT) $(DESTDIR)$(PREFIX)/bin/$(OUT)

clean:
	$(RM) $(OUT) $(OBJ)

.PHONY: install clean
