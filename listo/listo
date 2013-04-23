#!/bin/sh
#
# Runs listo - the task manager for mobilistas.
#

# Set jvm heap initial and maximum sizes (in megabytes).
if [ "$CLASSPATH" = "" ]; then
        CLASSPATH="/usr/share/java/listo/listo.jar"
else
        CLASSPATH="/usr/share/java/listo/listo.jar":$CLASSPATH
fi

exec "$JAVA_HOME/bin/java" -jar /usr/share/java/listo/listo.jar
