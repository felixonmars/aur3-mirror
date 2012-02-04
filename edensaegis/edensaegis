#!/bin/bash
unset WINEPREFIX
if [ ! -d "$HOME"/.edensaegis ] ; then
   mkdir -p "$HOME"/.edensaegis
   ln -s /usr/share/edensaegis/EdensAegis1.11.exe "$HOME"/.edensaegis/edensaegis
   ln -s /usr/share/edensaegis/custom.exe "$HOME"/.edensaegis/config
   ln -s /usr/share/edensaegis/img.dat "$HOME"/.edensaegis/img.dat
   ln -s -T /usr/share/edensaegis/bgm "$HOME"/.edensaegis/bgm
   ln -s -T /usr/share/edensaegis/wallpaper "$HOME"/.edensaegis/wallpaper
   ln -s -T /usr/share/edensaegis/se "$HOME"/.edensaegis/se
fi
cd "$HOME"/.edensaegis
WINEDEBUG=-all wine ./edensaegis "$@"

