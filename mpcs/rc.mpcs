#!/bin/bash

daemon_name=mpcs

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/$daemon_name

case "$1" in
  start)
    stat_busy "Starting $daemon_name daemon"

    PID=`cat /var/run/$daemon_name.pid 2>/dev/null`
    if [ -z "$PID" ]; then
      [ -f /var/run/$daemon_name.pid ] && rm -f /var/run/$daemon_name.pid
      # RUN
      $daemon_name $MPCS_ARGS
      #
      if [ $? -gt 0 ]; then
        stat_fail
        exit 1
      else
        add_daemon $daemon_name
        stat_done
      fi
    else
      stat_fail
      exit 1
    fi
    ;;

  stop)
    stat_busy "Stopping $daemon_name daemon"
    PID=`cat /var/run/$daemon_name.pid 2>/dev/null`
    # KILL
    [ ! -z "$PID" ] && kill $PID &> /dev/null
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
    sleep 3
    $0 start
    ;;

  reload)
    PID=`cat /var/run/$daemon_name.pid 2>/dev/null`
    kill -HUP $PID &> /dev/null
    ;;
  *)
    echo "usage: $0 {start|stop|restart|reload}"  
esac
exit 0
