#!/bin/sh
#
# Runs jEdit - Programmer's Text Editor.
#

# Set jvm heap initial and maximum sizes (in megabytes).
JAVA_HEAP_INIT_SIZE=64
JAVA_HEAP_MAX_SIZE=192

if [ "$CLASSPATH" = "" ]; then
        CLASSPATH="/usr/share/java/jedit/jedit.jar"
else
        CLASSPATH="/usr/share/java/jedit/jedit.jar":$CLASSPATH
fi

exec "$JAVA_HOME/bin/java" -Xms${JAVA_HEAP_INIT_SIZE}M -Xmx${JAVA_HEAP_MAX_SIZE}M -classpath $CLASSPATH -Djedit.home="/usr/share/jedit" $JAVA_OPTS org.gjt.sp.jedit.jEdit -background -reuseview "$@"
