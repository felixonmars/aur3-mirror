#!/bin/bash

# Create profile directory if it doesn't exist
if [ ! -d ~/.doomsday/doom2 ]
then
	mkdir -p ~/.doomsday/doom2
fi

# Launch the game
doomsday -game jdoom -alldehs -pwadtex -anifilter -userdir ~/.doomsday/doom2 -file /usr/share/deng/Data/jDoom/DOOM2.WAD $*
