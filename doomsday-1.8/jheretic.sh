#!/bin/bash

# Create profile directory if it doesn't exist
if [ ! -d ~/.doomsday/heretic ]
then
	mkdir -p ~/.doomsday/heretic
fi

# Launch the game
doomsday -game jheretic -alldehs -pwadtex -anifilter -userdir ~/.doomsday/heretic -file /usr/share/deng/Data/jHeretic/HERETIC.WAD $*
