#!/bin/bash

cd "/opt/enemy-territory"
./etded.x86 +set fs_game tcetest +exec server.cfg $*
exit $?
