#!/bin/sh
test $# -ne 1 && { echo "ipccat: usage: ipccat path" >&2; exit 100; }
exec /usr/bin/ipcclient -l0 -- "$1" sh -c 'exec cat <&6'
