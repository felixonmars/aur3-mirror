#! /bin/sh

flashplayer /usr/share/games/cursed-treasure/CursedTreasure.swf --class $(basename "${0%.*}") "$@"
