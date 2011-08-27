#!/bin/sh
unset WINEPREFIX
if [ ! -d "$HOME"/.project64 ] ; then
   echo "Notice: Copying entire Project64 into ~/.project64. To uninstall completely, don't forget to remove that (the .exes are in there too)."
   cp -R /usr/share/project64 "$HOME"/.project64
fi
WINEDEBUG=-all wine "$HOME"/.project64/Project64.exe "$@"
