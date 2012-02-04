#! /bin/sh

readonly GAME="sonny"

flashplayer "/usr/share/games/$GAME/$GAME.swf" --class "$GAME" "$@"
