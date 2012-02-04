#!/bin/bash

daemon_name=rabbit

. /etc/rc.d/functions

. /etc/conf.d/$daemon_name

. /etc/rc.conf

. /etc/profile.d/jre.sh

get_pid() {
	ps alx | awk '!/grep/ && /rabbit3\.jar/ { print $3 }'
}

case "$1" in
  start)
    stat_busy "Starting $daemon_name daemon"

    PID=`get_pid`
    if [ -z "$PID" ]; then
      [ -f /var/run/$daemon_name.pid ] && rm -f /var/run/$daemon_name.pid
      # RUN
      cd /var/lib/$daemon_name
      sudo -u rabbit $JAVA_HOME/bin/java -jar jars/rabbit3.jar -f /etc/rabbit/rabbit.conf & > /dev/null
      #
      if [ $? -gt 0 ]; then
        stat_fail
        exit 1
      else
        echo `get_pid` > /var/run/$daemon_name.pid
        add_daemon $daemon_name
        stat_done
      fi
    else
      stat_fail
      exit 1
    fi
    ;;

  stop)
    stat_busy "Stopping $daemon_name daemon"
    PID=`get_pid`
    # KILL
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    #
    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      rm -f /var/run/$daemon_name.pid &> /dev/null
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
