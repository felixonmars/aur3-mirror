#!/bin/sh
#
# Init file for OpenSCADA system demon.
#
# chkconfig: - 99 05
# description: Open SCADA System server daemon
#
# processname: openscada
# config: /etc/oscada.xml

# Source function library.
. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/bin/openscada`
case "$1" in
  start)
    stat_busy "Starting open scada daemon"
    if [ -z "$PID" ]; then 
       /usr/bin/openscada --demon &> /dev/null -i /var/run/openscada.pid -f
    fi
    if [ ! -z "$PID" -o $? -gt 0 ]; then
      stat_fail
    else
      add_daemon openscada
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping open scada daemon"
    [ ! -z "$PID" ] && kill $PID &>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon openscada
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