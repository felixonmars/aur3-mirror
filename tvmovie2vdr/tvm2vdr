#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/rc.tvm2vdr

case "$1" in
  start)
    stat_busy "Starting TVMovie2VDR"

    if [ `date +%H` = $TVM2VDRHOUR ]; then
      /usr/lib/vdr/tvmovie2vdr/tvm2vdr.sh &
    fi

    if [ $? -gt 0 ]; then
      stat_fail
    else
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping TVMovie2VDR"

    killall --quiet /usr/lib/vdr/tvmovie2vdr/tvm2vdr.sh

    stat_done
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"
    ;;
esac
