#!/bin/sh

if [ ! -d "$HOME/.d2x-xl" ]; then
  mkdir -p "$HOME/.d2x-xl"
  7za x -y "/usr/share/d2x-xl/d2x-xl-data.7z" -o"$HOME/.d2x-xl"
  cp "$HOME/.d2x-xl/data/descent.tex.eng" "$HOME/.d2x-xl/data/descent.tex"
fi

/usr/share/d2x-xl/d2x-xl
