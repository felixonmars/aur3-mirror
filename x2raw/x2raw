#!/bin/bash
mplayer -ao pcm "$1" -ao pcm:file="$1.wav"
sox -V "$1.wav" -r 8000 -c 1 "$1.raw"
rm "$1.wav"
