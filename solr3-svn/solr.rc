#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

SOLR_DIR=/usr/share/java/solr
[ -f /etc/conf.d/solr ] && . /etc/conf.d/solr

PID=$(ps aux | grep 'java -jar start.jar' | grep -v grep | awk '{print $2}')
case "$1" in
  start)
    cd $SOLR_DIR
    stat_busy "Starting Solr Daemon"
    if [ -z "$PID" ]; then 
       java -jar start.jar 2> /var/log/solr.log &
    fi
    if [ ! -z "$PID" -o $? -gt 0 ]; then
      stat_fail
    else
      PID=$(ps aux | grep 'java -jar start.jar' | grep -v grep | awk '{print $2}')
      echo $PID > /var/run/solr.pid
      add_daemon solr
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Solr Daemon"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon solr
      stat_done
    fi
    ;;
  status)
    if [ -z $PID ]; then
      echo "Solr service is down"
      exit 1
    else
      echo "Solr Service is Running"
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
