#!/bin/bash

package=$(basename $0)

export WINEPREFIX="$HOME/."$package"/wine"

if [ ! -d "$HOME"/."$package" ] ; then
  mkdir -p "$HOME"/."$package"/wine || exit 1
  ln -s /usr/share/"$package"/* "$HOME"/."$package" || exit 1
  ln -s /usr/share/msvc60/msvcp60.dll "$HOME"/."$package"|| exit 1
fi

pwd=$(pwd)
cd $HOME/."$package"
wine $HOME/."$package"/"$package".exe $*
cd $pwd