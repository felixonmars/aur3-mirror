#!/bin/sh
test $# -ne 1 && { echo "ipcconnect: usage: ipcconnect path" >&2; exit 100; }
exec /usr/bin/ipcclient -l0 -- "$1" /usr/bin/ipcconnect-io
