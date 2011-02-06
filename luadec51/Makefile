CC= gcc
CFLAGS= -O2 -Wall $(MYCFLAGS)
AR= ar rcu
RANLIB= ranlib
RM= rm -f
LIBS= -lm $(MYLIBS)

MYCFLAGS=-std=c99 -I../lua-5.1.4/src
MYLDFLAGS=
MYLIBS=

LUA_A=/usr/lib/liblua.a

LUADEC_T= luadec
LUADEC_O= guess.o luadec.o output.o print.o proto.o StringBuffer.o structs.o

$(LUADEC_T): $(LUADEC_O)
	$(CC) -o $@ $(MYLDFLAGS) $(LUADEC_O) $(LUA_A) $(LIBS)

