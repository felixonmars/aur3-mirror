#!/bin/bash

# Create profile directory if it doesn't exist
if [ ! -d ~/.doomsday/doom2-plutonia ]
then
	mkdir -p ~/.doomsday/doom2-plutonia
fi

# Launch the game
doomsday -game jdoom -alldehs -pwadtex -anifilter -userdir ~/.doomsday/doom2-plutonia -file /usr/share/deng/Data/jDoom/PLUTONIA.WAD $*
