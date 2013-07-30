#!/bin/bash

mkdir -p ~/.nightsky-game
cd ~/.nightsky-game
if [ ! -f NightSkyHD ]
then
    ln -s /opt/NightSky/* .
    mkdir Settings
fi
./NightSkyHD
