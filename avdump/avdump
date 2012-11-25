#!/bin/bash

# export WINEARCH=win32
export WINEPREFIX="$HOME/.avdump/wine"

if [ ! -d "$WINEPREFIX" ] ; then
  mkdir -p "$WINEPREFIX" || exit 1
  wineboot -u
fi

wine "/usr/share/avdump/avdump.exe" "$@"
