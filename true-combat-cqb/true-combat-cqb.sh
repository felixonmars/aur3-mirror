#!/bin/sh

cd "/opt/enemy-territory"
./et.x86 +set fs_game cqbtest +set com_soundMegs 64 +set com_hunkMegs 256 +set com_zoneMegs 64 +set s_khz 44 +set r_maxpolyverts 16384 +set r_maxpolys 4096 $*
exit $?
