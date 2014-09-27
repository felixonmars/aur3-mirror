#!/bin/sh
unset WINEPREFIX
if [ ! -d "$HOME"/.heli-x5 ] ; then
   echo "Notice: Copying heli-x5 into ~/.heli-x5. To uninstall completely, don't forget to remove ~/.heli-x5."
   mkdir "$HOME"/.heli-x5
   rsync -av /usr/share/heli-x5/* "$HOME"/.heli-x5
fi
"$HOME"/.heli-x5/runHELI-X.sh
