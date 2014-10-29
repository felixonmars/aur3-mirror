#!/bin/sh

SALSA_JAR=/usr/share/java/salsa/salsa1.1.5.jar
export CLASSPATH=$SALSA_JAR:$CLASSPATH

java salsac.SalsaCompiler "$@"

javac $(for i in $@ ; do echo $i | sed s/salsa/java/ ; done)
