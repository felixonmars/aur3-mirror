#!/bin/bash

PROFILE=/tmp/firefox-qt-hg
if [ -d $PROFILE ]; then
    rm -R $PROFILE
fi
mkdir -p $PROFILE

cd $HOME/.mozilla/firefox
if [ ! -f $HOME/.mozilla/firefox/EXPERIMENTAL ]; then
    mv profiles.ini profiles.ini.original

    echo "[General]
StartWithLastProfile=1

[Profile0]
Name=default
IsRelative=0
Path=/tmp/firefox-qt-hg
Default=1" > profiles.ini
    touch EXPERIMENTAL
fi
