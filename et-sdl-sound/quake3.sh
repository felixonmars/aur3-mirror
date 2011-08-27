#!/bin/sh
cd "/opt/quake3"
export LD_PRELOAD="et-sdl-sound.so ${LD_PRELOAD}"
[ -x ./quake3.x86 ] && exec ./quake3.x86 $*
[ -x ./ioquake3.i386] && exec ./ioquake3.i386 $*
