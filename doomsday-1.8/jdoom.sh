#!/bin/bash

# Create profile directory if it doesn't exist
if [ ! -d ~/.doomsday/doom ]
then
	mkdir -p ~/.doomsday/doom
fi

# Launch the game
doomsday -game jdoom -alldehs -pwadtex -anifilter -userdir ~/.doomsday/doom -file /usr/share/deng/Data/jDoom/DOOM.WAD $*
