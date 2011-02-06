#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting Asusoled Daemon"
    /usr/bin/asusoled -e &> /dev/null
    /usr/bin/asusoled-clock &
    add_daemon asusoled-clockd
    stat_done
    ;;
  stop)
    stat_busy "Stopping asusoled Daemon"
    /usr/bin/killall asusoled-clock
    /usr/bin/asusoled -d
    rm_daemon asusoled-clockd
    stat_done
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
exit 0
