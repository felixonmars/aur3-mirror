#!/bin/sh
CLASSPATH=/usr/share/java/saxon/saxon9.jar
"$JAVA_HOME/bin/java" -classpath $CLASSPATH net.sf.saxon.Query "$@";
