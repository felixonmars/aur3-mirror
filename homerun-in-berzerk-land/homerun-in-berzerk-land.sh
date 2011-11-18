#! /bin/sh

flashplayer /usr/share/games/homerun-in-berzerk-land/homerun-bezerk.swf --class $(basename "${0%.*}") "$@"
