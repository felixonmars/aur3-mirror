#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/mailgraph

case "$1" in
  start)
    stat_busy "Starting Mailgraph"
    nice -19 $MAILGRAPH_PL -l $MAIL_LOG -d --daemon-pid=$PID_FILE \
      --daemon-rrd=$RRD_DIR
    
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon mailgraph
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Mailgraph"
    kill `cat $PID_FILE`
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm $PID_FILE
      rm_daemon mailgraph
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

