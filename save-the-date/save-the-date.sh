#!/usr/bin/env sh
exec env RENPY_BASE=${RENPY_BASE:-/usr/share/renpy/} python2 -OO "/usr/share/save-the-date/savethedate.py" /usr/share/save-the-date "$@"
