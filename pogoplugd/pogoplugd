#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

[ -f /etc/conf.d/pogoplugd ] && . /etc/conf.d/pogoplugd

PID=`pidof -o %PPID /usr/bin/pogoplugfs`
case "$1" in
  start)
    stat_busy "Starting pogoplugd"
    if [ $USER = 'yourusername' ]; then
        echo "Please edit /etc/conf.d/pogoplugd before using this script."
        stat_fail
    fi
    [ -z "$PID" ] && su -c "/usr/bin/pogoplugfs $POGOPLUGD_ARGS & disown" $USER
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon pogoplugd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping pogoplugd"
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon pogoplugd
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 3
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
exit 0
