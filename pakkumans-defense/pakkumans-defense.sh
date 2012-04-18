#!/bin/sh
if [[ $CARCH == 'x86_64' ]]; then
  export GTK_PATH="/usr/lib32/gtk-2.0"
fi

cd "/usr/share/games/pakkumans-defense"
./pd_linux
return "$?"
