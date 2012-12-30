#!/bin/sh
# without this line gDEBugger won't find libGL.so.1 on 64-bit systems
#export LIBGL_DRIVERS_PATH="/usr/lib/dri"

cd /opt/gDEBugger
exec ./gDEBugger "$@"
