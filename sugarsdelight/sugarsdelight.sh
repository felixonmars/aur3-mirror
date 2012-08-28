#!/usr/bin/env sh
exec env RENPY_BASE=${RENPY_BASE:-/usr/share/renpy/} python2 -OO "/usr/share/sugarsdelight/SugarsDelight.py" /usr/share/sugarsdelight "$@"
