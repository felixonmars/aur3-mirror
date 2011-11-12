#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

DAEMON=hgd-playd

PID=$(get_pid $DAEMON)

case "$1" in
  start)
    if [ ! -r "/var/hgd/hgd.db" ]; then
      printhl "You must run 'hgd-admin db-init' before starting playd"
      stat_fail
      exit 1
    fi

    stat_busy "Starting $DAEMON"

    [ -z "$PID" ] && `which $DAEMON` &>/dev/null
    if [ $? = 0 ]; then
      add_daemon $DAEMON
      stat_done
    else
      stat_fail
      exit 1
    fi
    ;;
  stop)
    stat_busy "Stopping $DAEMON"
    [ -n "$PID" ] && kill $PID &>/dev/null
    if [ $? = 0 ]; then
      rm_daemon $DAEMON
      stat_done
    else
      stat_fail
      exit 1
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

# vim:set ts=2 sw=2 et:
