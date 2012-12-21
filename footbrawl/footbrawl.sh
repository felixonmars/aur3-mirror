#!/bin/bash

# enable per-user configuration:
# user's config file is copied to var,
# which is symlinked to usr/share

if [ -d "$XDG_CONFIG_HOME" ] ; then
   cfgfile="$XDG_CONFIG_HOME/footbrawl"
elif [ -d ~/.config ] ; then
   cfgfile=~/.config/footbrawl
else
   cfgfile=~/.footbrawl  
fi

if [ ! -e "$cfgfile" ] ; then
  echo '{}' > "$cfgfile"
fi

cat "$cfgfile" > /var/games/footbrawl/game.cfg

# run the game

cd /usr/share/footbrawl
java -jar footbrawl.jar

