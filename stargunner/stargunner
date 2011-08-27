#!/bin/bash

# Before running the game for the first time, some stuff needs to be done.

# Set some symlinks and prepare the game environment.
if [ ! -d "$HOME"/.stargunner ] ; then
  mkdir "$HOME"/.stargunner || exit 1
  ln -s /usr/share/stargunner/STARGUN.EXE "$HOME"/.stargunner/STARGUN.EXE || exit 1
  ln -s /usr/share/stargunner/SETUP.EXE "$HOME"/.stargunner/SETUP.EXE || exit 1
  ln -s /usr/share/stargunner/STARGUN.DLT "$HOME"/.stargunner/STARGUN.DLT || exit 1
fi

# Individual Dosbox config file
if [ ! -f "$HOME"/.stargunner/dosbox.conf ] ; then
  cp /usr/share/stargunner/dosbox.conf.dist "$HOME"/.stargunner/dosbox.conf || exit 1
fi

# Run the game
dosbox "$HOME"/.stargunner/STARGUN.EXE -conf "$HOME"/.stargunner/dosbox.conf -exit "$@"

