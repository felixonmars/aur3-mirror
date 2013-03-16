#!/bin/bash
export WINEPREFIX="$HOME"/.jwpce/wine WINEDLLOVERRIDES="mscoree,mshtml="

if [ ! -d "$HOME"/.jwpce ] ; then
   mkdir -p "$HOME"/.jwpce
   wineboot -u
fi

WINEDEBUG=-all wine /usr/share/jwpce/jwpce.exe +"$HOME"/.jwpce/ "$@"
