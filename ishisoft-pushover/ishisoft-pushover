#!/bin/bash

package="ishisoft-pushover"

export WINEPREFIX="$HOME/."$package"/wine"

if [ ! -d "$HOME"/."$package" ] ; then
  mkdir -p "$HOME"/."$package"/wine || exit 1
  mkdir -p "$HOME"/."$package"/Data/Profiles || exit 1
  mkdir -p "$HOME"/."$package"/Data/Map/2 || exit 1

  ln -s /usr/share/"$package"/*.* "$HOME"/."$package" || exit 1
  ln -s /usr/share/"$package"/{Intro,Resource} "$HOME"/."$package" || exit 1
  ln -s /usr/share/"$package"/Data/Map/0 "$HOME"/."$package"/Data/Map || exit 1

  cp /usr/share/"$package"/Data/Map/2/* "$HOME"/."$package"/Data/Map/2 || exit 1

  wineprefixcreate || exit 1
fi

oldpwd=$(pwd)
cd $HOME/."$package"
echo $0 | grep -q editor || wine $HOME/."$package"/Pushover.exe $*
echo $0 | grep -q editor && wine $HOME/."$package"/Editor.exe $*
cd $oldpwd