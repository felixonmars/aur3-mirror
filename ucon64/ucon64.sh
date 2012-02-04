#!/bin/sh

if [ ! -e $HOME/.ucon64 ]; then
  mkdir -p $HOME/.ucon64/dat
  echo "This is your first time running uCON64. You can"
  echo "copy/move your DAT file collection to:"
  echo "$HOME/.ucon64/dat"
  echo "Be sure to modify the config file at $HOME/.ucon64rc"
  echo "after you've run uCON64 once."
  echo ""
  cd /usr/share/ucon64
  cp discmage.so $HOME/.ucon64/
  ./ucon64 "$@"
else
  cd /usr/share/ucon64
  ./ucon64 "$@"
fi
