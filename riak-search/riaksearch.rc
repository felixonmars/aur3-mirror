#!/bin/bash

bin=/var/lib/riaksearch/bin/riaksearch
daemon_name=riaksearch

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting $daemon_name daemon"

    # RUN
    $bin start
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
    $bin stop
    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      rm_daemon $daemon_name
      stat_done
    fi
    ;;

  restart)
    stat_busy "Restarting $daemon_name"
    $bin restart
    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      rm_daemon $daemon_name
      stat_done
    fi
    ;;

  attach)
    stat_busy "Attaching to riak console"
    $bin attach
    stat_done
    ;;

  console)
    stat_busy "Starting riak console"
    $bin console
    stat_done
    ;;

  status)
    stat_busy "Checking Status"
    $bin ping
    stat_done
    ;;

  *)
    echo "usage: $0 {start|stop|restart|attach|console|status}"
esac

exit 0
