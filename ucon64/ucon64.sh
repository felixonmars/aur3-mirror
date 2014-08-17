#!/bin/sh

if [ ! -e $HOME/.ucon64 ]; then
  mkdir -p $HOME/.ucon64/dat
  cd /usr/share/ucon64
  cp discmage.so $HOME/.ucon64/
  ./ucon64 "$@"
  echo ""
  echo "This was your first time running uCON64. You can"
  echo "copy/move your DAT file collection to:"
  echo "$HOME/.ucon64/dat"
  echo "Be sure to check $HOME/.ucon64rc for some options."
else
  cd /usr/share/ucon64
  ./ucon64 "$@"
fi
