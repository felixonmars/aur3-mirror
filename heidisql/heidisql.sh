#!/bin/bash

progName="heidisql"
progRealPath="/usr/share/$progName"
progHome="$HOME/.$progName"
progBin="$progName.exe"

# Folder doesn't exist?
if [ ! -d "$progHome" ] ; then
  # Create folder
  mkdir -p "$progHome" || exit 1
  
  # Create read-only symlinks
  ln -s "$progRealPath/$progBin" "$progHome/$progBin" || exit 1
  ln -s "$progRealPath/libmysql.dll" "$progHome/libmysql.dll" || exit 1
  
  # Create a blank config file (otherwise HeidiSQL stores its settings in the Windows Registry)
  touch "$progHome/portable_settings.txt"
fi

WINEDEBUG=-all wine "$progHome/$progBin" "$@"