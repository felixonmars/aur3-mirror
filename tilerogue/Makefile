CC = gcc
CFLAGS = -O2 `sdl-config --cflags` 
LDFLAGS = -s
LDLIBS = `sdl-config --cflags --libs` -lSDL_mixer
OBJS = rogue.o os.o os_sdl.o font.o mtwist.o
TARGET = TileRogue

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o$@
