#!/bin/sh
cd /usr/share/enemy-territory
LD_PRELOAD="et-sdl-sound.so ${LD_PRELOAD}" exec ./et +set fs_game tcetest $*

