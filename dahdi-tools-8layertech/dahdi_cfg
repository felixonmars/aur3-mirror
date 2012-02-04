#!/bin/bash

daemon_name="DAHDI With OSLEC Echo Canceller"

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting $daemon_name"
    /usr/sbin/dahdi_cfg &>/dev/null
    /usr/sbin/dahdi_genconf &>/dev/null
    /usr/sbin/dahdi_registration &>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping $daemon_name"
    stat_done
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"
esac

exit 0
