#!/bin/sh

if [ $UID -eq 0 ]
then
    SERVIIO_CONSOLE_HOME="/usr/share/java/serviio"
    
    CP="$SERVIIO_CONSOLE_HOME/lib/serviio-client.jar:$SERVIIO_CONSOLE_HOME/lib/serviio.jar:$SERVIIO_CONSOLE_HOME/lib/log4j.jar:$SERVIIO_CONSOLE_HOME/lib/slf4j-api.jar:$SERVIIO_CONSOLE_HOME/lib/slf4j-log4j12.jar:$SERVIIO_CONSOLE_HOME/lib/jul-to-slf4j.jar:$SERVIIO_CONSOLE_HOME/lib/org.restlet.jar:$SERVIIO_CONSOLE_HOME/lib/org.restlet.ext.xstream.jar:$SERVIIO_CONSOLE_HOME/lib/xstream.jar:$SERVIIO_CONSOLE_HOME/config"
    
    JAVA_OPTS="-Dserviio.home=$SERVIIO_CONSOLE_HOME -Djava.net.preferIPv4Stack=true"
    
    java -Xmx384M $JAVA_OPTS -classpath $CP org.serviio.console.ServiioConsole "$@"
else
    echo "Must be run as root."
fi
