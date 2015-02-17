#!/bin/sh

export LD_LIBRARY_PATH=/usr/share/meshmixer/lib

exec /usr/share/meshmixer/meshmixer "$@"
