#!/bin/bash
DAEMON=$(type -p puppetd)

. /etc/rc.conf
. /etc/rc.d/functions
[ -f /etc/conf.d/puppet ] && . /etc/conf.d/puppet

PID=$(pidof -xo %PPID $DAEMON)
case "$1" in
  start)
    stat_busy "Starting Puppet Daemon"
    if [ -z "$PID" ]; then 
      [ -f /var/run/puppet.pid ] && rm -f /var/run/puppet.pid
      $DAEMON $PUPPETD_ARGS
    fi
    if [ ! -z "$PID" -o $? -gt 0 ]; then
      stat_fail
    else
      PID=$(pidof -xo %PPID $DAEMON)
      echo $PID > /var/run/puppet.pid
      add_daemon puppet
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Puppet Daemon"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon puppet
      rm -f /var/run/puppet.pid
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
