#! /bin/sh

readonly GAME="sonny2"

flashplayer "/usr/share/games/$GAME/$GAME.swf" --class "$GAME" "$@"
