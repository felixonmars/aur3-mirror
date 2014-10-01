#!/bin/sh
export CRYSTAL_PATH="$CRYSTAL_PATH:/usr/lib/crystal/src:/usr/lib/crystal/libs"
exec "${CRYSTAL_BIN:-/usr/lib/crystal/crystal}" "$@"
