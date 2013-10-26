#!/bin/sh
if [ ! -f $AGENAPATH/library.agn ]; then
  AGENAPATH=/usr/lib/agena agena.elf $*
else
  agena.elf $*
fi
