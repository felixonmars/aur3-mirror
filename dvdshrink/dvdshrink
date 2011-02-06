#!/bin/bash

package=$(basename $0)

export WINEPREFIX="$HOME/."$package"/wine"

if [ ! -d "$HOME"/."$package" ] ; then
  mkdir -p "$HOME"/."$package"/wine || exit 1
  mkdir -p "$HOME"/."$package"/Still\ Images || exit 1
#  mkdir -p "$HOME"/."$package"/Web || exit 1

  cp -r /usr/share/"$package"/Still\ Images/* "$HOME"/."$package"/Still\ Images || exit 1
  ln -s /usr/share/"$package"/*.* "$HOME"/."$package" || exit 1
  ln -s /usr/share/"$package"/Web "$HOME"/."$package" || exit 1

  wineprefixcreate || exit 1
fi

wine $HOME/."$package"/DVD\ Shrink\ 3.2.exe $*
