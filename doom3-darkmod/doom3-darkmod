#!/bin/sh

if [ ! -e "$HOME"/.doom3/darkmod ] ;then
   mkdir -p "$HOME"/.doom3/darkmod/
   cp -r /opt/doom3/darkmod/fms "$HOME"/.doom3/darkmod/
fi

cd /opt/doom3/
./thedarkmod.x86 "$@"
