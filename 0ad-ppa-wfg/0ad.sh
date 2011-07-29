#!/bin/bash

cd /usr/games
LD_LIBRARY_PATH=/usr/lib/games/0ad/libfix LD_PRELOAD=/usr/lib/games/0ad/libfix/libboost_filesystem.so.1.40.0:/usr/lib/games/0ad/libfix/libboost_system.so.1.40.0 ./0ad $*
