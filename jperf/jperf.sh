#!/bin/sh

PREFIX=/usr/share/jperf
CLASSPATH=$(echo $(ls $PREFIX/*.jar) | sed 's/ /:/g')
java -classpath $CLASSPATH net.nlanr.jperf.JPerf
