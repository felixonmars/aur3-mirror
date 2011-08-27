#!/bin/bash
export WINEPREFIX="$HOME/.ventrilo/wine"

# Before running the game for the first time, some stuff needs to be done.

if [ ! -d "$HOME"/.ventrilo ] ; then
  mkdir -p "$HOME"/.ventrilo/wine || exit 1
  wineboot || exit 1
  ln -s /usr/share/ventrilo/ventrilo.exe "$HOME"/.ventrilo/ventrilo || exit 1
  ln -s /usr/share/ventrilo/{*.wav,default.vet} "$HOME"/.ventrilo/ || exit 1
  ln -s /usr/share/doc/ventrilo "$HOME"/.ventrilo/Doc || exit 1
fi

# We need the system directory to exist prior to attempting to copy the requiredacm file.
if [ ! -d "$HOME"/.ventrilo/wine/drive_c/windows/system ]; then 
  mkdir -p "$HOME"/.ventrilo/wine/drive_c/windows/system || exit 1
fi

# Copy the msgsm32.acm file to the system32 directory or the game won't run
if [ ! -f "$HOME"/.ventrilo/wine/drive_c/windows/system/msgsm32.acm ]; then
  ln -s /usr/share/ventrilo/msgsm32.acm "$HOME"/.ventrilo/wine/drive_c/windows/system/msgsm32.acm || exit 1
  # Sed magic to add the msgsm32.acm
  sed 's/\[drivers32\]/&\nMSACM.msgsm610=msgsm32.acm/' "$HOME"/.ventrilo/wine/drive_c/windows/system.ini > "$HOME"/.ventrilo/wine/drive_c/windows/system.ini2 || exit 1
  mv "$HOME"/.ventrilo/wine/drive_c/windows/system.ini2 "$HOME"/.ventrilo/wine/drive_c/windows/system.ini || exit 1
fi

# Run the game
wine "$HOME"/.ventrilo/ventrilo "$@"
