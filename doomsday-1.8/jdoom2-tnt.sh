#!/bin/bash

# Create profile directory if it doesn't exist
if [ ! -d ~/.doomsday/doom2-tnt ]
then
	mkdir -p ~/.doomsday/doom2-tnt
fi

bugfix=/usr/share/deng/Data/jDoom/TNT31.WAD
if [ -e $bugfix ]
then
	bugfix="-file $bugfix"
else
	bugfix=""
fi

# Launch the game
doomsday -game jdoom -alldehs -pwadtex -anifilter -userdir ~/.doomsday/doom2-tnt -file /usr/share/deng/Data/jDoom/TNT.WAD $bugfix $*
