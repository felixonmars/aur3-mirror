#!/bin/sh

cd "/opt/enemy-territory"
./et.x86 +set fs_game tcetest $*
exit $?
