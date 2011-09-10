#!/bin/bash

[ -f /etc/conf.d/apache-solr ] && . /etc/conf.d/apache-solr

. /etc/rc.conf
. /etc/rc.d/functions

name=apache-solr
pidfile=/var/run/$name.pid
java=$JAVA_HOME/bin/java

case "$1" in
  start)
    stat_busy "Starting Apache Solr"
    cd /opt/$name
    $java -jar /opt/$name/start.jar $APACHE_SOLR_OPTIONS > /dev/null 2>&1 &

    if [ $? -gt 0 ]; then
      stat_fail
    else
      echo $! > $pidfile
      add_daemon $name
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Apache Solr"
    if [ -f $pidfile ]; then
      pid=`cat $pidfile`
      kill -9 $pid
      if [ $? -gt 0 ]; then
        stat_fail
      else
        rm_daemon $name
        [ -f $pidfile ] && rm $pidfile
        stat_done
      fi
    else
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
