#!/bin/bash

daemon_name=firestarter

. /etc/rc.conf
. /etc/rc.d/functions

FS='/etc/firestarter/firestarter.sh'

case "$1" in
  start)
    stat_busy "Starting $daemon_name"

    # Call firestarter script
    $FS start > /dev/null
    #
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
    
    # Call firestarter script
    $FS stop > /dev/null
    #
    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      rm_daemon $daemon_name
      stat_done
    fi
    ;;

  restart)
    $0 stop
    $0 start
    ;;

  status)
    stat_busy "Checking $daemon_name status";
    ck_status $daemon_name
    ;;

  *)
    echo "usage: $0 {start|stop|restart|status}"
esac

exit 0
