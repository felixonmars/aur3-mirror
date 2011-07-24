#!/bin/sh
export LD_LIBRARY_PATH=/usr/lib/x2go
exec /usr/bin/x2goagent.bin "$@"
