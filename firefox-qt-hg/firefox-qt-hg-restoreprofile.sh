#!/bin/bash

cd $HOME/.mozilla/firefox

if [ -f $HOME/.mozilla/firefox/EXPERIMENTAL ]; then
    mv profiles.ini.original profiles.ini
    rm EXPERIMENTAL
fi
