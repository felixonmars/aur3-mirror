#!/bin/sh
# Needed to make symlinks/shortcuts work.
# the binaries must run with correct working directory
cd "/opt/iowolfet"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.
exec ./ioetded.i386 +exec server.cfg $*
