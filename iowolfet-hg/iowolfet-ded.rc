#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

ET_BIN=/opt/iowolfet/ioetded.i386
PID=`pidof -o %PPID $ET_BIN`

case "$1" in
  start)
    stat_busy "Starting Enemy Territory Dedicated Server"
    [ -z "$PID" ] && `su games -c "/opt/iowolfet/iowolfet-ded &> /dev/null &"`
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon etded
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Enemy Territory Dedicated Server"
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon etded
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 2
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"
esac
