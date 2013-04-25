CC=gcc
CFLAGS=-c
BFLAGS=-o # BUILD/LINK FLAGS

SRC=stardate.c
BIN=stardate

all: $(BIN)

$(BIN): $(BIN).o
	$(CC) $(BIN).o $(BFLAGS) $(BIN)

$(BIN).o: $(SRC)
	$(CC) $(CFLAGS) $(SRC)

clean:
	rm -rf *o stardate





