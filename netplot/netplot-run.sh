#!/bin/bash
cd /usr/share/netplot
export CLASSPATH=./
export CLASSPATH=$CLASSPATH:./lib/jrobin-1.4.0.jar
java NetPlot
