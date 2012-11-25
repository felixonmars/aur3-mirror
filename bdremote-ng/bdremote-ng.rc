#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/bdremote-ng

case "$1" in
  start)
    stat_busy "Starting bdremote-ng ... "
    success=0
    /usr/sbin/bdremoteng -a $REMOTE_ADDRESS -d 1 > /var/log/bdremote-ng.log 2>&1 || success=$!
    if [ $success -eq 0 ]; then
      add_daemon bdremote-ng
      stat_done
    else
      stat_fail
    fi
    ;;
  stop)
    stat_busy "Stopping bdremote-ng ..."
    killall bdremoteng >/dev/null 2>&1
    rm_daemon bdremote-ng
    stat_done
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
