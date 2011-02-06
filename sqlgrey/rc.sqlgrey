#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting sqlgrey Daemon"
    #
    # We need to cd to sqlgrey user home dir since
    # if we're using sqlite as the database, it will
    # put all it's files in the CWD.
    cd ~sqlgrey
    /usr/sbin/sqlgrey -d
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon sqlgrey
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping sqlgrey Daemon"
    /usr/sbin/sqlgrey -k
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon sqlgrey
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  *)
    echo "usage: $0 (start|stop|restart)"
esac
exit 0
