#!/bin/sh
LD_LIBRARY_PATH=/usr/lib/netextender
export LD_LIBRARY_PATH

/usr/lib/netextender/netExtender "$@"
