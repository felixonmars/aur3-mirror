#!/bin/sh

test -z "$BLENDER_USER_CONFIG"    && export BLENDER_USER_CONFIG=~/.blender
test -z "$BLENDER_USER_SCRIPTS"   && export BLENDER_USER_SCRIPTS=~/.blender/scripts
test -z "$BLENDER_USER_DATAFILES" && export BLENDER_USER_DATAFILES=~/.blender

exec /usr/share/blender/blender "$@"
