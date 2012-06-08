#!/bin/bash
export WINEPREFIX="$HOME/.progressquest/wine"

if [ ! -d "$HOME"/.progressquest ] ; then
  mkdir -p "$HOME"/.progressquest/wine || exit 1
  ln -s /usr/share/progressquest/pq.exe "$HOME"/.progressquest/pq || exit 1
fi

wine "$HOME"/.progressquest/pq "$@"
