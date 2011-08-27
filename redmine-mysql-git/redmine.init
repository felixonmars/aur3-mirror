#!/bin/bash
# $Id$
daemon_name=redmine-webrick

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/redmine.conf

RUBY_CMD=/usr/bin/ruby

get_pid() {
   if [ -f $PIDFILE ]; then
      cat $PIDFILE
   fi
}

case "$1" in
  start)
    stat_busy "Starting $daemon_name standalone webserver"

    PID=$(get_pid)
    if [ -z "$PID" ]; then
      [ -f $PIDFILE ] && rm -f $PIDFILE
      # RUN
      su redmine -c "${RUBY_CMD} ${REDMINE_HOME}/script/server -d -e ${REDMINEDB} > ${REDMINE_LOG} 2>&1" 
      # did the daemon start correctly?
      if [ $? -gt 0 ]; then
        echo "daemon could not get started successfully"
        stat_fail
        exit 1
      else
        if [ -f $PIDFILE ]; then
          add_daemon $daemon_name
          stat_done        
        else 
          echo "daemon has not created pid-file"
          stat_fail
          exit 1        
        fi
      fi
    else
      stat_fail
      exit 1
    fi
    ;;

  stop)
    stat_busy "Stopping $daemon_name webserver"
    PID=$(get_pid)
    # KILL
    [ ! -z "$PID" ] && kill -9 $PID &> /dev/null
    #
    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      rm -f $PIDFILE &> /dev/null
      rm_daemon $daemon_name
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
exit 0
