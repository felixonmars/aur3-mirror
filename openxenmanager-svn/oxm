#!/bin/bash
(
  OXCDIR=/opt/openxenmanager-svn
  CONFIGDIR=$HOME/.openxenmanager
  CONFIG=oxc.conf

  if [ ! -e "$CONFIGDIR/$CONFIG" ];then
    mkdir $CONFIGDIR
    cp {$OXCDIR,$CONFIGDIR}/$CONFIG
  fi

  cd $OXCDIR
  python2 window.py|grep -v "gtk-vnc-DEBUG"|grep -v ^$
)
