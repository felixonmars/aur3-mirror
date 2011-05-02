#!/bin/sh

# Launch PCSX2 emulator
if [ -x /opt/pcsx2/pcsx2 ]; then
	cd /opt/pcsx2
	./pcsx2 $*
else 
	echo "PCSX2 executable not found" && exit 1
fi

