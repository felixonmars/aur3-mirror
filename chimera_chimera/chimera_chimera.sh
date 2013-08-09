#!/bin/bash

# enables per-user configuration:
# symlinks /usr/share/chimera_chimera to ~/.local/share/chimera_chimera

if [ -d "$XDG_DATA_HOME" ] ; then
   localdir="$XDG_DATA_HOME/chimera_chimera"
elif [ -d ~/.local/share ] ; then
   localdir=~/.local/share/chimera_chimera
else
   localdir=~/.chimera_chimera
fi

if [ ! -e "$localdir/config.ini" ] ; then
  install -d "$localdir"
  cd "$localdir"
  ln -s /usr/share/chimera_chimera/chimera.py .
  cp /usr/share/chimera_chimera/config.ini .
  for a in images levels music sfx ; do
	mkdir ${a}
	ln -s /usr/share/chimera_chimera/${a}/* ${a}
  done;
fi

# make sure it uses avbin7

if [ ! -e "$localdir/libavbin.so" ] ; then
  ln -s /usr/lib/libavbin.so.7 "$localdir/libavbin.so"
fi

# run the game

cd "$localdir" 
LD_LIBRARY_PATH=. python2 chimera.py
