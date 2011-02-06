#!/bin/bash
DAEMON=$(type -p puppetmasterd)

. /etc/rc.conf
. /etc/rc.d/functions
[ -f /etc/conf.d/puppetmaster ] && . /etc/conf.d/puppetmaster

PID=$(pidof -xo %PPID $DAEMON)
case "$1" in
  start)
    stat_busy "Starting Puppet Master Daemon"
    if [ -z "$PID" ]; then 
      [ -f /var/run/puppetmaster.pid ] && rm -f /var/run/puppetmaster.pid
      $DAEMON $PUPPETMASTER_ARGS
    fi
    if [ ! -z "$PID" -o $? -gt 0 ]; then
      stat_fail
    else
      PID=$(pidof -xo %PPID $DAEMON)
      echo $PID > /var/run/puppetmaster.pid
      add_daemon puppetmaster
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Puppet Master Daemon"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon puppetmaster
      rm -f /var/run/puppetmaster.pid
      stat_done
    fi
    ;;
  restart)
    $0 stop
    if [ ! -z $PID ]; then
      while ps -p $PID > /dev/null; do sleep 1; done
    fi
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
