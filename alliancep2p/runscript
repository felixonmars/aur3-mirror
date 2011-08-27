#!/bin/sh

adir="$HOME/.alliancep2p"
aprogname="alliancep2p.jar"
aprog="$adir/$aprogname"
asharedir="/usr/share/alliancep2p"

if [ -d "$adir" ]
then
  if [ ! -e "$aprog" ]
  then
    ln -s "$asharedir/$aprogname" "$aprog"
  fi
else 
  mkdir "$adir"
  ln -s "$asharedir/$aprogname" "$aprog"
fi 

cd "$adir"
exec java -jar "$aprog" "$@"
