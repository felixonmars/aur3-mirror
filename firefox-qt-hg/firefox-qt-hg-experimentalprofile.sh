#!/bin/bash

if [ ! -f $HOME/.mozilla/firefox/EXPERIMENTAL ]; then
    source /usr/bin/firefox-qt-hg-freshprofile
fi

/usr/bin/firefox-qt-hg

source /usr/bin/firefox-qt-hg-restoreprofile

