#!/bin/bash
	
. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/915resolution

case "$1" in
  start)
    stat_busy "Patching the VBIOS"
    /usr/sbin/915resolution $MODE $RESOLUTION >/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      stat_done
    fi
    ;;
  stop)
    /bin/true
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
