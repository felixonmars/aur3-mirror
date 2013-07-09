#!/usr/bin/env bash

cd /usr/share/wart
if command which rlwrap >&/dev/null
then
  rlwrap -C wart ./wart_bin $*
else
  ./wart_bin $*
fi
