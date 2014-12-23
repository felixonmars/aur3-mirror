#!/bin/sh

p="application.name='Galcon 2'"
p="$p application.icon_name=galcon2"
p="$p media.role=game"
export PULSE_PROP="$p"

export SDL_VIDEO_X11_WMCLASS="galcon2"

cd /opt/galcon2/bin && exec ./main
