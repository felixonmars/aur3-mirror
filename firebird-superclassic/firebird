#!/bin/bash

daemon_name=firebird
pidfile=/var/run/$daemon_name.pid
manager=/opt/firebird/bin/fb_smp_server
runas=root

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting $daemon_name daemon"

    su - $runas -c "$manager -pidfile $pidfile -start -forever > /dev/null 2>&1"

    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      add_daemon $daemon_name
      stat_done
    fi
    ;;

  stop)
    stat_busy "Stopping $daemon_name daemon"

    kill `cat $pidfile` > /dev/null 2>&1

    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      rm_daemon $daemon_name
      stat_done
    fi
    ;;

  restart)
    $0 stop
    sleep 3
    $0 start
    ;;

  *)
    echo "usage: $0 {start|stop|restart}"
esac
exit 0
