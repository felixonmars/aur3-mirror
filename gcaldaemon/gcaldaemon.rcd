#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

pid_file="/var/run/gcaldaemon.pid"
JAVA_HOME=/opt/java/jre
PATH=$JAVA_HOME/bin:/$PATH

case "$1" in
  start)
    stat_busy "Starting GCALDaemon"
    /opt/gcaldaemon/bin/standalone-start.sh &> /dev/null &
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon gcaldaemon
      PID=`ps aux | grep -i "java" | grep -i "gcaldaemon" | awk '{print ""$2""}'`
      echo $PID > $pid_file
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping GCALDaemon"
    [ -f $pid_file ] && PID=`cat $pid_file`
    [ ! -z "$PID" ] || PID=`ps aux | grep -i "java" | grep -i "gcaldaemon" | awk '{print ""$2""}'`
    [ -z "$PID" ] || kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon gcaldaemon
      rm -f $pid_file
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
