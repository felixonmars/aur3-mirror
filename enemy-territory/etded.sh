#!/bin/sh
# Needed to make symlinks/shortcuts work.
# the binaries must run with correct working directory
cd "/opt/enemy-territory"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.
exec ./etded.x86 +exec server.cfg $*
