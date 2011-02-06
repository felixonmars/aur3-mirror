#!/bin/sh
cd /usr/share/java/sunflow
if [ `free -m | grep Mem | awk '{printf("%s",$2)}'` -gt 1024 ]; then
	java -server -Xmx`free -m | grep Mem | awk '{printf("%s",$2)}'`M -jar sunflow.jar  $@
else
	java -server -Xmx1G -jar sunflow.jar  $@
fi
