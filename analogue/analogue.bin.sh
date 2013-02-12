#!/bin/sh
export PULSE_PROP="application.icon_name=analogue"
export PULSE_PROP_OVERRIDE="application.name='Analogue: A Hate Story'"
export SDL_VIDEO_X11_WMCLASS="analogue"
exec /opt/analogue/Analogue.sh "$@"
