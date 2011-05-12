#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting Teeworlds Catch16 Server"
    if [ $(pidof /usr/bin/teeworlds-srv-catch16) ]; then
    	stat_fail
    else
	su andy -c '/usr/bin/teeworlds-srv-catch16 -f /srv/teeworlds/catch16.cfg &> /var/log/teeworlds-catch16.log &'
	add_daemon teeworlds-catch16
    fi
    stat_done
    ;;
  stop)
    stat_busy "Stopping Teeworlds Catch16 Server"
    killall teeworlds-srv-catch16 &> /dev/null
    if [ $? -gt 0 ]; then
	stat_fail
    else
	rm_daemon teeworlds-catch16
	stat_done
    fi
    ;;
  restart)
  $0 stop
  $0 start
  ;;
*)
    echo "usage: $0 {start|stop|restart}"
esac
exit 0
