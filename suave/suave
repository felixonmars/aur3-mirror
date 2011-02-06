#!/bin/bash

package=$(basename $0)

export WINEPREFIX="$HOME/."$package"/wine"

if [ ! -d "$HOME"/."$package" ] ; then
  mkdir -p "$HOME"/."$package"/wine || exit 1
  mkdir -p "$HOME"/."$package"/Levels || exit 1

  cp -r /usr/share/"$package"/Levels "$HOME"/."$package" || exit 1
  ln -s /usr/share/"$package"/*.* "$HOME"/."$package" || exit 1

  wineprefixcreate || exit 1
fi

wine $HOME/."$package"/SUAVE.exe $*
