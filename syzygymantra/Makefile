EXE_NAME = mantra

CC = gcc 
CFLAGS = -O2 -Wall -Iinclude -Isrc -c -DMANTRA_WINDOWS

OUR_LIBRARIES = -laldmb -ldumb -lalfont -lalleg -lfreetype
LDFLAGS = -Wl -Wall

SRCFILES = src/Dialogs.c \
           src/Enemies.c \
           src/EnemyCollision.c \
           src/EnemyUpdate.c \
           src/GameConstants.c \
           src/Input.c \
           src/LoadData.c \
           src/main.c \
           src/Map.c \
           src/OpeningScreen.c \
           src/Saric.c \
           src/Sound.c \
           src/Tests.c \
           src/Utils.c \

OBJFILES = $(SRCFILES:.c=.o)

%.o: %.c
	$(CC) $(CFLAGS) -o $@ $<

all: $(EXE_NAME)

$(EXE_NAME): $(OBJFILES)
	$(CC) $(LDFLAGS) -o $(EXE_NAME) $(OBJFILES) $(OUR_LIBRARIES) $(INT_LIBRARIES)
	@(echo "All done!  Enjoy Mantra!")
