#!/bin/sh
pulse=`pgrep pulseaudio|wc -l`
if [ $pulse -lt 1 ] ; then
	/usr/bin/javaws /opt/liveperson/JRep.def.jnlp
else
	padsp /usr/bin/javaws /opt/liveperson/JRep.def.jnlp
fi
