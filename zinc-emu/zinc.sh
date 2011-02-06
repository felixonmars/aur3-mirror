#!/bin/bash

if [ ! -e $HOME/.zinc ]; then
  echo ""
  echo "Running ZiNc for the first time..."
  echo "Copy your roms to the corresponding folder within $HOME/.zinc"
  echo "You should also edit the zinc.cfg and <renderer>.cfg files with"
  echo "your desired plugins and settings."
  echo ""
  mkdir $HOME/.zinc
  mkdir $HOME/.zinc/{cfg,roms,snap}
  cp /usr/share/zinc-emu/zinc.cfg $HOME/.zinc/
  sed -e 's|~|'"$HOME"'|g' -i $HOME/.zinc/zinc.cfg
  cp /usr/share/zinc-emu/cfg/* $HOME/.zinc/cfg/
  cd /usr/share/zinc-emu/
  ./zinc "$@" --use-config-file=$HOME/.zinc/zinc.cfg
else
  comm -23 <(ls /usr/share/zinc-emu/cfg/) <(ls ~/.zinc/cfg/) | while read file
  do
    echo ""
    echo "Copying $file to $HOME/.zinc/cfg/"
    echo "Update your zinc.cfg file to use the new plugin and cfg file."
    echo ""
    cp /usr/share/zinc-emu/cfg/$file $HOME/.zinc/cfg/$file
  done
  cd /usr/share/zinc-emu/
  ./zinc "$@" --use-config-file=$HOME/.zinc/zinc.cfg
fi
