#!/bin/bash

pkg=winscp4

export WINEPREFIX="$HOME/.$pkg/wine"
export WINEDLLOVERRIDES="mscoree,mshtml="

if [ ! -d "$HOME"/.$pkg ] ; then
  mkdir -p "$HOME"/.$pkg || exit 1
  ln -s /usr/share/$pkg/$pkg.exe "$HOME"/.$pkg/$pkg.exe || exit 1
fi

wine "$HOME"/.$pkg/$pkg.exe "$@"