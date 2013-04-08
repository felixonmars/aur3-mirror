#!/usr/bin/env bash

flashplayer /usr/share/ppp4/minuette/minuette.swf --class $(basename "${0%.*}") "$@"
