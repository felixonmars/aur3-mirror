#!/bin/bash
export WINEPREFIX="$HOME/.tou/wine"

# Before running the game for the first time, some stuff needs to be done.

# Set some symlinks and prepare the game environment.
if [ ! -d "$HOME"/.tou ] ; then
  mkdir -p "$HOME"/.tou/{wine,swap} || exit 1
  ln -s /usr/share/doc/tou "$HOME"/.tou/doc || exit 1
  ln -s /usr/share/tou/data "$HOME"/.tou/data || exit 1
  ln -s /usr/share/tou/ggstuff "$HOME"/.tou/ggstuff || exit 1
  ln -s /usr/share/tou/levels "$HOME"/.tou/levels || exit 1
  ln -s /usr/share/tou/makelev "$HOME"/.tou/makelev || exit 1
  ln -s /usr/share/tou/music "$HOME"/.tou/music || exit 1
  ln -s /usr/share/tou/sfx "$HOME"/.tou/sfx || exit 1
  ln -s /usr/share/tou/ships "$HOME"/.tou/ships || exit 1
  ln -s /usr/share/tou/fmod.dll "$HOME"/.tou/fmod.dll || exit 1
  ln -s /usr/share/tou/ijl10.dll "$HOME"/.tou/ijl10.dll || exit 1
  ln -s /usr/share/tou/readme.txt "$HOME"/.tou/readme.txt || exit 1
  ln -s /usr/share/tou/TOU.exe "$HOME"/.tou/tou || exit 1
fi

# Run the game
cd "$HOME"/.tou/
wine ./tou "$@"

