#!/bin/sh
#
# Runs gstreamer pipeline
#

GST_CLASSPATH="/usr/share/java/gstreamer-java/gstreamer-java.jar:/usr/share/java/jna/jna.jar"

if [ "$CLASSPATH" = "" ]; then
        CLASSPATH=$GST_CLASSPATH
else
        CLASSPATH=$GST_CLASSPATH:$CLASSPATH
fi

"$JAVA_HOME/bin/java" -classpath $CLASSPATH $JAVA_OPTS org.gstreamer.example.PipelineLauncher "$@"
