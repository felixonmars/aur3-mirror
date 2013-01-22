#!/bin/bash

# general config
. /etc/conf.d/zemberek

# Decide which java to use!

if [ -f /etc/profile.d/jdk.sh ] ;then
	source /etc/profile.d/jdk.sh
elif [ -f /etc/profile.d/jre.sh ]; then
	source /etc/profile.d/jre.sh
elif [ -f /etc/profile.d/openjdk6.sh ]; then
	source /etc/profile.d/openjdk6.sh
else
	echo "YOU NEED TO INSTALL JAVA!"
fi

PID=$(pidof -- $JAVA_HOME/bin/java ${ZEMBEREK_ARGS})
case "$1" in
    start)
        if [ -z "$PID" ]; then
            $JAVA_HOME/bin/java ${ZEMBEREK_ARGS} > /dev/null &
            $PID
        fi
        ;;
    stop)
        [ ! -z "$PID" ] && kill $PID &> /dev/null
        ;;
    restart)
        $0 stop
        sleep 1
        $0 start
        ;;
    *)
        echo "usage: $0 {start|stop|restart}"
        ;;
esac
exit 0
