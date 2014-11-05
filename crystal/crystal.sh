#!/bin/sh
export CRYSTAL_PATH="src:libs" # :(
exec "${CRYSTAL_BIN:-/usr/lib/crystal/crystal}" "$@" # :((
