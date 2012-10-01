#!/bin/bash
export EMSCRIPTEN=$(readlink -f $(dirname $0)/../lib/emscripten)
export EM_CONFIG=$EMSCRIPTEN/emscripten-config
export PYTHONPATH=$EMSCRIPTEN:$PYTHONPATH
exec $EMSCRIPTEN/$(basename $0) $*
