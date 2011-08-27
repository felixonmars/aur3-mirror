#!/bin/bash

. /etc/conf.d/oftpd
. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/bin/oftpd`
case "$1" in
  start)
    stat_busy "Starting oftpd"
    [ -z "$PID" ] && /usr/bin/oftpd $OFTPD_ARGS "$OFTPD_USER" "$OFTPD_PATH"
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon oftpd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping oftpd"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon oftpd
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
