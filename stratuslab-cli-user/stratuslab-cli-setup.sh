#!/bin/sh

export STRATUSLAB_ROOT=/opt/stratuslab

echo "::: STRATUSLAB_ROOT=$STRATUSLAB_ROOT"

if [ ! -n "$PATH" ]; then
    export PATH=${STRATUSLAB_ROOT}/bin
else
    export PATH=${PATH}:${STRATUSLAB_ROOT}/bin
    echo "==> [${STRATUSLAB_ROOT}/bin]"
fi

if [ ! -n "$PYTHONPATH" ]; then
    export PYTHONPATH=${STRATUSLAB_ROOT}/lib/stratuslab/python
else
    export PYTHONPATH=${PYTHONPATH}:${STRATUSLAB_ROOT}/lib/stratuslab/python
fi

echo "::: PATH: $PATH"
