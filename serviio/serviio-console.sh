#!/bin/sh

if [ $UID -eq 0 ]
then
    SERVIIO_CONSOLE_HOME="/usr/share/java/serviio"
    
    CP="$SERVIIO_CONSOLE_HOME/lib/*:$SERVIIO_CONSOLE_HOME/config"
    
    JAVA_OPTS="-Dserviio.home=$SERVIIO_CONSOLE_HOME -Djava.net.preferIPv4Stack=true"
    
    java -Xmx384M $JAVA_OPTS -classpath $CP org.serviio.console.ServiioConsole "$@"
else
    echo "Must be run as root."
fi
