# Executables
CC = gcc
INSTALL = install

# Flags
CFLAGS = -std=c99 -fpic -Wall -pedantic
LDFLAGS = -shared
LDLIBS = -lz

# Directories
LUA_CDIR = $(DESTDIR)/usr/lib/lua/5.1/
SRCDIR ?= .
BUILDDIR ?= $(SRCDIR)

# Files
SRC = $(SRCDIR)/lua_zlib.c
OBJ = $(BUILDDIR)/lua_zlib.o
LIB = $(BUILDDIR)/zlib.so

# Targets
all: $(LIB)

install: $(LIB)
	$(INSTALL) $(LIB) $(LUA_CDIR)

$(LIB): $(OBJ)
	$(CC) $(LDFLAGS) -o $(LIB) $(OBJ) $(LDLIBS)

$(OBJ): $(SRC)
