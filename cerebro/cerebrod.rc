#!/bin/bash

daemon_name=/usr/sbin/cerebrod
PID=$(pidof -o %PPID $daemon_name)

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting $daemon_name daemon"
    if [[ -z $PID ]]; then
      [[ -f /run/$daemon_name.pid ]] && rm -f /run/$daemon_name.pid

      $daemon_name

      if [[ $? > 0 ]]; then
        stat_fail
        exit 1
      else
        echo $PID > /run/$daemon_name.pid
        add_daemon $daemon_name
        stat_done
      fi
    else
      stat_fail
      exit 1
    fi
    ;;

  stop)
    stat_busy "Stopping $daemon_name daemon"
    [[ -n $PID ]] && kill $PID &> /dev/null

    if [[ $? > 0 ]]; then
      stat_fail
      exit 1
    else
      rm -f /run/$daemon_name.pid &> /dev/null
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
    stat_busy "Checking $daemon_name daemon"
    ck_status $daemon_name
    ;;

  *)
    echo "usage: $0 {start|stop|restart|status}"
esac

exit 0

# vim:set ts=2 sw=2 et:
