#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting Teeworlds zcatch Server"
    if [ $(pidof /usr/bin/teeworlds-zcatch-server) ]; then
    	stat_fail
    else
	/usr/bin/teeworlds-zcatch-server -f /srv/teeworlds/zcatch.cfg &> /var/log/teeworlds-zcatch.log &
	add_daemon teeworlds-zcatch
    fi
    stat_done
    ;;
  stop)
    stat_busy "Stopping Teeworlds zcatch Server"
    killall teeworlds-zcatch-server &> /dev/null
    if [ $? -gt 0 ]; then
	stat_fail
    else
	rm_daemon teeworlds-catching
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
