#!/bin/sh

if [ $UID -eq 0 ]
then
    SERVIIO_HOME="/usr/share/java/serviio"
    
    CP="$SERVIIO_HOME/lib/*:$SERVIIO_HOME/config"
    
    JAVA_OPTS="-Djava.net.preferIPv4Stack=true -Djava.awt.headless=true -Dderby.system.home=$SERVIIO_HOME/library -Dserviio.home=$SERVIIO_HOME"
    
    java -Xmx384M $JAVA_OPTS -classpath $CP org.serviio.MediaServer "$@"
else
    echo "Must be run as root."
fi
