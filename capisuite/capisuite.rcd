#!/bin/bash

daemon_name=capisuite

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/local/sbin/capisuite`
case "$1" in
  start)
	ck_depends 'capiinit'

    stat_busy "Starting Capisuite"
    [ -z "$PID" ] && /usr/local/sbin/capisuite -d
    if [ $? -gt 0 ]; then
	stat_fail
    else
      add_daemon $daemon_name
      pidof -o %PPID /usr/local/sbin/capisuite > /var/run/$daemon_name.pid
      stat_done
    fi
    ;;

  stop)
    stat_busy "Stopping Capisuite"
    [ ! -z "$PID" ] && kill $PID /usr/local/sbin/capisuite &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon $daemon_name
	rm /var/run/$daemon_name.pid
      stat_done
    fi
    ;;

  reload)
    stat_busy "Reloading Capisuite"
    [ ! -z "$PID" ] && kill -HUP $PID /usr/local/sbin/capisuite &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      stat_done
    fi
    ;;

  restart)
    stat_busy "Restarting Capisuite"
    $0 stop
    sleep 1
    $0 start
    ;;
  status)
    stat_busy "Checking Capisuite status";
    ck_status $daemon_name
    ;;

  *)
    echo "usage: $0 {start|stop|reload|restart|status}"
esac

exit 0
