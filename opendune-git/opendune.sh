#!/bin/sh
#
# OpenDUNE launcher
#
# Does some magic juggling with the data files

mkdir -p $HOME/.opendune/data

if [ ! -f $HOME/.opendune/data/dune.cfg ]; then

  cp /opt/opendune/data/{dune.cfg,put_dune2_here.txt} $HOME/.opendune/data/

fi

if [ -f $HOME/.opendune/data/dune.pak ]; then

  cd $HOME/.opendune
  /opt/opendune/opendune "$@"
  cd - &>/dev/null

else

  echo "Please place Dune II data files in \"$HOME/.opendune/data\"."

fi
