#!/usr/bin/env sh
exec env RENPY_BASE=${RENPY_BASE:-/usr/share/renpy/} python2 -OO "/usr/share/realistair/RE-alistair.py" /usr/share/realistair "$@"
