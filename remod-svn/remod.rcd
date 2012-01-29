#!/bin/bash


. /etc/conf.d/remod
. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting Remod"
    if [ -s $REMOD_PID ]; then
      stat_fail
      # probably ;)
      stat_busy "Remod is already running"
      stat_die
    fi
    echo > $REMOD_PID
    chown $REMOD_USER:remod $REMOD_PID
    su - $REMOD_USER -s /bin/sh -c "/usr/bin/remod -d -p$REMOD_PID -gserver.log -k$REMOD_DATA -q$REMOD_HOME &>/dev/null" 
    if [ $? -ne 0 ]; then
      stat_fail
    else
      add_daemon remod
      stat_done
    fi
    ;;

  stop)
    stat_busy "Stopping Remod"
    if [ -f $REMOD_PID ];
    then
      kill `cat $REMOD_PID`
      rm -f  $REMOD_PID
      rm_daemon remod
      stat_done
    else
      stat_fail
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
