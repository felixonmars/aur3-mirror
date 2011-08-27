#!/bin/bash

# Create profile directory if it doesn't exist
if [ ! -d ~/.doomsday/hexen ]
then
        mkdir -p ~/.doomsday/hexen
fi

# Launch the game
doomsday -game jhexen -alldehs -pwadtex -anifilter -userdir ~/.doomsday/hexen -file /usr/share/deng/Data/jHexen/HEXEN.WAD $*
