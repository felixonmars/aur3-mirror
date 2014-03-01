#!/usr/bin/bash

export LD_PRELOAD="/usr/lib/libframetime.so:/usr/lib32/libframetime.so:$LD_PRELOAD"
exec "$@"
