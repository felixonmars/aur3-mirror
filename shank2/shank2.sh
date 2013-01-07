#!/bin/sh

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/share/shank2/lib/
cd /usr/share/shank2/bin/
exec ./shank2 "$@"
