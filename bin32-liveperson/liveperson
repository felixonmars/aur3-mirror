#!/bin/sh
pulse=`pgrep pulseaudio|wc -l`
if [ $pulse -lt 1 ] ; then
	/opt/java/jre/bin/javaws -J-Xms64m -J-Xmx1024m -J-Xms64m -J-Xmx1024m -Xnofork /opt/liveperson/JRep.def.jnlp
else
	padsp /opt/java/jre/bin/javaws -J-Xms64m -J-Xmx1024m -J-Xms64m -J-Xmx1024m -Xnofork /opt/liveperson/JRep.def.jnlp
fi