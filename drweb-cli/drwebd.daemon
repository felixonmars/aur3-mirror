#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /opt/drweb/drwebd`
PIDFILE="/var/drweb/run/drwebd.pid"
BIN="drwebd"
PROGRAM="/opt/drweb/${BIN}"

check_run() {
RUNFILE=/etc/drweb/${BIN}.enable
    if [  -f ${RUNFILE} ]; then
		. ${RUNFILE}
		if test "${ENABLE}" != "1" ; then
			echo "DrWeb Daemon is disabled according to ${RUNFILE}"
			exit 0
		fi
	fi
}

case "$1" in
  start)
    stat_busy "Starting Dr.Web daemon"
    [ -z "$PID" ] && ${PROGRAMM}
    if [ $? -gt 0 ]; then
      stat_fail
    else
      echo $(pidof -o %PPID -x ${PROGRAMM}) > ${PIDFILE}
      add_daemon ${BIN}
      stat_done
    fi
    ;;
  stop)
    stat_busy "Shutting down Dr.Web daemon"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm ${PIDFILE}
      rm_daemon ${BIN}
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
    reload)
	stat_busy "Reloading Dr.Web daemon"
    [ ! -z "$PID" ]  &&  kill -HUP `head -1 $PIDFILE`
		if [ $? -gt 0 ]; then
				stat_fail
			else
				stat_done
		fi
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
exit 0
