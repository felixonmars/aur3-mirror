#!/bin/sh

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/shank2/lib/
cd /opt/shank2/bin/
exec ./shank2 "$@"
