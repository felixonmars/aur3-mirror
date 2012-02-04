#!/bin/sh

mkdir -p ~/.nightsky-game/
cd ~/.nightsky-game/
if test ! -f Game.ini; then
    ln -s /opt/NightSkyHD/* .
    rm Settings
    cp -r /opt/NightSkyHD/Settings .
fi

./NightSkyHD

