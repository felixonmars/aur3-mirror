#!/bin/sh
cd /opt/GuitarPro6
if [ -e ./libz.so.1 ] ; then
	gksu -m "WARNING: A local library that is known to cause issue with Guitar Pro 6 has been detected. You will need to put in the administrative password to remove and fix this library, or Guitar Pro may refuse to run. Select cancel to skip this." "rm -f /opt/GuitarPro6/libz.so.1"
fi
./GuitarPro "$*"
