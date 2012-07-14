#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting tdsm"
    cd "/srv/tdsm"
    su - tdsm -c 'screen -d -m -S tdsm tdsm' &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon tdsm
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping tdsm"
    su - tdsm -c "script /dev/null -c 'screen -S tdsm -X stuff 'exit'`echo -ne '\015'`'"
    killall -w -s 2 /usr/bin/tdsm &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon tdsm
      stat_done
    fi
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  attach)
    su - tdsm -c "script /dev/null -c 'screen -r'"
    ;;
  *)
    echo "usage: $0 {start|stop|restart|attach}"
esac
exit 0
