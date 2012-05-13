#!/bin/sh

mkdir -p ~/.Bombermaaan/Levels

echo "Copying game levels to '~/.Bombermaaan/Levels'..."
cp -f /usr/share/bombermaaan/levels/* ~/.Bombermaaan/Levels && echo "Done!" && exit

echo "Error!"
