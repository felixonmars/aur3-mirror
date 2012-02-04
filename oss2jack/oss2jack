#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting oss2jack Daemon"
if [ -z `pidof /usr/bin/jackd` ];
	then
	echo "You need to start jack-audio-connection-kit before oss2jack."
	stat_fail
	exit 1
else
	if  [ -z `pidof /usr/bin/oss2jack` ];
	then
	/usr/bin/oss2jack 2>/dev/null &
	add_daemon oss2jack
	stat_done
else
	echo "You can't start oss2jack as it's already running."
fi
    fi
    ;;
  stop)
    stat_busy "Stopping oss2jack Daemon"
    if [ -n `pidof /usr/bin/oss2jack` ];
    then
	killall oss2jack 2>/dev/null
	killall -9 oss2jack 2>/dev/null
	stat_done
	rm_daemon oss2jack
    else
	echo "oss2jack is not running so you can't kill it"
	stat_fail
	
    fi
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
