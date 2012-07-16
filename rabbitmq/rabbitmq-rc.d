#!/bin/bash

daemon_name=rabbitmq
export HOME=/usr/lib/rabbitmq

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting $daemon_name daemon"

    # RUN
    /usr/sbin/rabbitmq-server -detached
    #
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
    # KILL
    /usr/sbin/rabbitmqctl stop
    #
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

  status)
    stat_busy "Checking $daemon_name status";
    ck_status $daemon_name
    ;;

  *)
    echo "usage: $0 {start|stop|restart|status}"
esac

exit 0
