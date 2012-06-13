#!/bin/sh
# OrientDB init script

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/orientdb

PID=$(ps -ef | grep 'orientdb.www.path' | grep java | grep -v grep | awk '{print $2}')
case "$1" in
  start)
    stat_busy "Starting OrientDB"
    [ -z "$PID" ] && su -c "cd \"$ORIENTDB_DIR/bin\"; /usr/bin/nohup ./server.sh 1>>../log/orientdb.log 2>>../log/orientdb.err &" - $ORIENTDB_USER
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon orientdb
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping OrientDB"
    [ ! -z "$PID" ]  && su -c "cd \"$ORIENTDB_DIR/bin\"; /usr/bin/nohup ./shutdown.sh 1>>../log/orientdb.log 2>>../log/orientdb.err &" - $ORIENTDB_USER
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon orientdb
      stat_done
    fi
    ;;
  status)
    stat_busy "Checking OrientDB status";
    ck_status orientdb
    ;;	
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart|status}"
esac
exit 0

