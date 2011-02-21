#!/bin/sh

# Launch PCSX2 in any build mode
cd /opt/pcsx2/
for i in pcsx2-dbg pcsx2-dev pcsx2 fail; do
	if [ -x $i ]; then
		./$i $*
		exit $?
	fi
done
# If did not find, then...
echo "PCSX2 executable not found" && echo 1

