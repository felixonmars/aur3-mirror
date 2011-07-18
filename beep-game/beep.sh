#!/bin/sh
cd /opt/beep
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./lib/linux64
./BEEP.bin32 $@
