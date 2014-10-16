#!/bin/sh
export LC_ALL=C # bug with profile saving when using locale with . as decimal separator
export LD_LIBRARY_PATH="/usr/share/OculusConfigUtil/lib/:$LD_LIBRARY_PATH"
cd /usr/share/OculusConfigUtil/
./OculusConfigUtil_x86_64 "$@"
