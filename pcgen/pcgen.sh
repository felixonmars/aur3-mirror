#!/bin/sh

cd /opt/pcgen
"$JAVA_HOME/bin/java" -Xms128m -Xmx256m -jar ./pcgen.jar "$@"
