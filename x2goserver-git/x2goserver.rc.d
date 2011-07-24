#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

daemon_name=x2goserver
daemon_bin=/usr/sbin/x2gocleansessions
pid_file=/var/run/$daemon_name.pid

case $1 in
  start)
    stat_busy "Starting $daemon_name daemon"

    if [[ ! -f "$pid_file" ]] && "$daemon_bin"; then
      add_daemon $daemon_name
      stat_done
    else
      stat_fail
      exit 1
    fi
    ;;
  stop)
    stat_busy "Stopping $daemon_name daemon"
    if [[ -f "$pid_file" ]] && kill $(<"$pid_file") &> /dev/null; then
      rm_daemon $daemon_name
      stat_done
    else
      stat_fail
      exit 1
    fi
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  *)
    echo "Usage: $0 {start|stop|restart}"
    exit 1
esac
