#!/bin/bash



. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting DDRace Server"
    cd /etc/
    /usr/bin/ddrace_srv -f /etc/ddrace.conf  >/dev/null &2>&1
    sleep 5
    if [ $? -gt 0 ]; then
      stat_fail
    else
      pidof ddrace_srv > /var/run/ddraced.pid
      add_daemon ddraced
      stat_done
    fi
    ;;
  debug)
    stat_busy "Starting DDRace Server DEBUG"
   cd /etc/ 
   /usr/bin/ddrace_srv -f /etc/ddrace.conf
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon ddraced
      stat_done
    fi
    ;;

  stop)
    stat_busy "Stopping DDRace Server"
    [ -f /var/run/ddraced.pid ] && kill $(cat /var/run/ddraced.pid) &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm -f /var/run/ddraced.pid
      rm_daemon ddraced
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart|debug}"
esac
exit 0

