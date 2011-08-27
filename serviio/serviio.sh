#!/bin/sh

if [ $UID -eq 0 ]
then
    SERVIIO_HOME="/usr/share/java/serviio"
    
    CP="$SERVIIO_HOME/lib/serviio.jar:$SERVIIO_HOME/lib/derby.jar:$SERVIIO_HOME/lib/jcs.jar:$SERVIIO_HOME/lib/concurrent.jar:$SERVIIO_HOME/lib/freemarker.jar:$SERVIIO_HOME/lib/httpcore.jar:$SERVIIO_HOME/lib/jaudiotagger.jar:$SERVIIO_HOME/lib/jul-to-slf4j.jar:$SERVIIO_HOME/lib/jcl-over-slf4j.jar:$SERVIIO_HOME/lib/log4j.jar:$SERVIIO_HOME/lib/sanselan.jar:$SERVIIO_HOME/lib/slf4j-api.jar:$SERVIIO_HOME/lib/slf4j-log4j12.jar:$SERVIIO_HOME/lib/org.restlet.jar:$SERVIIO_HOME/lib/org.restlet.ext.xstream.jar:$SERVIIO_HOME/lib/xstream.jar:$SERVIIO_HOME/config"
    
    JAVA_OPTS="-Djava.net.preferIPv4Stack=true -Dderby.system.home=$SERVIIO_HOME/library -Dserviio.home=$SERVIIO_HOME"
    
    java -Xmx384M $JAVA_OPTS -cp $CP org.serviio.MediaServer "$@"
else
    echo "Must be run as root."
fi
