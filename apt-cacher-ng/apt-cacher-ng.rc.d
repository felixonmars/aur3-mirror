#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PIDFILE="/run/apt-cacher-ng/pid"

case "$1" in
  start)
    stat_busy "Starting apt-cacher-ng"
    PID="$(pidof -o %PPID /usr/bin/apt-cacher-ng)"
    if [ -z "$PID" ]; then
      /usr/bin/apt-cacher-ng -c /etc/apt-cacher-ng/
      if [ $? -gt 0 ]; then
        stat_fail
      else
        # wait until it forks
        sleep 2
        echo $(pidof -o %PPID /usr/bin/apt-cacher-ng) > $PIDFILE
        add_daemon apt-cacher-ng
        stat_done
      fi
    else
      stat_fail
    fi
    ;;
  stop)
    stat_busy "Stopping apt-cacher-ng"
    if [ -f $PIDFILE ] && kill -0 $(cat $PIDFILE); then
      kill -15 $(cat $PIDFILE)
      rm $PIDFILE
      stat_done
    else
      stat_fail
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
