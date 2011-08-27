#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

get_pid() {
	echo `ps h -U isida -opid`
}

case "$1" in
  start)
    stat_busy "Starting iSida jabber bot"
    PID=`get_pid`
    if [ -z "$PID" ]; then
      su isida -s /bin/bash - -c 'cd /usr/share/isida && svn up && echo `svnversion` > settings/version && python2.5 start.py' 1>/dev/null 2>/dev/null &
      if [ $? -gt 0 ]; then
        stat_fail
        exit 1
      else
        add_daemon isida
        echo `get_pid` > /var/run/isida.pid
        stat_done
      fi
    else
      stat_fail
      exit 1
    fi
    ;;
  stop)
    stat_busy "Stopping iSida jabber bot"
    PID=`get_pid`
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      rm -f /var/run/isida.pid &> /dev/null
      rm_daemon isida
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
