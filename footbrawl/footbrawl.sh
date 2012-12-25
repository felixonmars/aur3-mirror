#!/bin/bash

# enables per-user configuration:
# symlinks /usr/share/footbrawl to ~/.local/share/footbrawl

if [ -d "$XDG_DATA_HOME" ] ; then
   localdir="$XDG_DATA_HOME/footbrawl"
elif [ -d ~/.local/share ] ; then
   localdir=~/.local/share/footbrawl
else
   localdir=~/.footbrawl  
fi

if [ ! -e "$localdir/game.cfg" ] ; then
  install -d "$localdir"
  cd "$localdir"
  ln -s /usr/share/footbrawl/* .
  echo '{}' > game.cfg
fi

# run the game

cd "$localdir" 
java -jar footbrawl.jar
