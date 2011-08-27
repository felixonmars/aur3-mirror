#!/bin/bash
#by Limoto (Jakub Luzny <Kuba.Luzny@seznam.cz>)

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/sbin/tuncfg`
case "$1" in
  start)
    stat_busy "Starting TUN/TAP Daemon"
    [ -z "$PID" ] && /usr/sbin/tuncfg
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon tuntap
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping TUN/TAP Daemon"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon tuntap
      stat_done
    fi
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
