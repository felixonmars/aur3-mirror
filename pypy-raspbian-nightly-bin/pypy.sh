#!/usr/bin/sh
export LD_LIBRARY_PATH="/opt/pypy/compatlibs:$LD_LIBRARY_PATH"
/opt/pypy/bin/pypy "$@"
