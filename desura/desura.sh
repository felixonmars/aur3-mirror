#!/bin/bash
export LD_LIBRARY_PATH=./lib:$LD_LIBRARY_PATH

if [[ ! -f "/opt/desura/desura" ]]; then
    /opt/desura/bin/desura
else
    /opt/desura/desura
fi
