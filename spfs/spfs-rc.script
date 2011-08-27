#!/bin/bash

daemon_name=spfs

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/${daemon_name}.conf

PID="$(cat /var/run/${daemon_name}.pid 2>/dev/null)"
case "$1" in
  start)
    stat_busy "Starting Plan 9 file server Daemon"
    [ -z "$PID" ] && [ ! -z "$SPFS_USER" ] && su $SPFS_USER -c "/usr/bin/ufs $SPFS_ARGS </dev/null >/dev/null 2>&1 &"
    sleep 1s
    PID=`pidof -o %PPID /usr/bin/ufs`
    if [ -z "$PID" ]; then
      stat_fail
    else
      echo $PID > /var/run/${daemon_name}.pid
      add_daemon ${daemon_name}
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Plan 9 file server Daemon"
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm -f /var/run/${daemon_name}.pid
      rm_daemon ${daemon_name}
      stat_done
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
exit 0
