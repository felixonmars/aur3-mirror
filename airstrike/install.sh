#!/bin/bash
pkgname=airstrike
cp $pkgname.sh /opt/games/airstrike-pre6a-src &&
xdg-desktop-menu install --novendor airstrike.desktop & 
cp //opt/games/airstrike-pre6a-src/airstrikerc ~/.$pkgnamerc &
ln -s /opt/games/airstrike-pre6a-src/$pkgname.sh /usr/bin/$pkgame
 
