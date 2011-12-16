#!/bin/sh
# Unix shell script for starting jarcomp If you have big files
# you might need to adjzst Xmx setting.

JARCOMP_HOME=/usr/share/java/jarcomp

$JAVA_HOME/bin/java -Xmx256m -jar $JARCOMP_HOME/jarcomp.jar $1 $2
