#!/bin/bash

# source application-specific settings
[ -f /etc/conf.d/squeezeboxserver ] && . /etc/conf.d/squeezeboxserver

# general config
. /etc/rc.conf
. /etc/rc.d/functions

squeezehome=/home/squeezeboxserver
pidfile=/var/run/squeezeboxserver.pid
logfile=/var/log/squeezeboxserver.log
prefsdir=/home/squeezeboxserver/prefs
cachedir=/var/cache/squeezeboxserver


case "$1" in
  start)
    stat_busy "Starting SqueezeBoxServer"
    cd $squeezehome
    ./slimserver.pl --daemon --user squeezeboxserver --prefsdir $prefsdir \
    --cachedir $cachedir --pidfile $pidfile --logfile $logfile $SQUEEZEBOXSERVER_OPTS 
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon squeezeboxserver
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping SqueezeBoxServer"
    kill `cat $pidfile` &>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon squeezeboxserver
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
