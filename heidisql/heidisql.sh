#!/bin/bash

progName="heidisql"
progRealPath="/usr/share/$progName"
progHome="$HOME/.$progName"
progBin="$progName.exe"

# Create folder
mkdir -p "$progHome" >/dev/null 2>&1

# Create read-only symlinks
ln -s "$progRealPath/$progBin" "$progHome/$progBin" >/dev/null 2>&1
ln -s "$progRealPath/readme.txt" "$progHome/readme.txt" >/dev/null 2>&1
ln -s "$progRealPath/libmysql.dll" "$progHome/libmysql.dll" >/dev/null 2>&1

# Create a blank config file (otherwise HeidiSQL stores its settings in the Windows Registry)
touch "$progHome/portable_settings.txt"

WINEDEBUG=-all wine "$progHome/$progBin" "$@"