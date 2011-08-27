#!/bin/sh
cd "/opt/wolf"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:."
export LD_PRELOAD="et-sdl-sound.so ${LD_PRELOAD}"
exec ./wolf.x86 "$@"

