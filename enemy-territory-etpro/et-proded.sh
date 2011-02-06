#!/bin/sh
cd /opt/enemy-territory
exec ./etded.x86 +set dedicated 2 +set fs_game etpro +exec server.cfg $*
