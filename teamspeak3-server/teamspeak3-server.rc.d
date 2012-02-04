#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/teamspeak3-server

PID=$(pidof -o %PPID /opt/teamspeak3-server/ts3server_linux_x86)
case "$1" in
  start)
    stat_busy "Starting Teamspeak3-Server"
    [ -z "$PID" ] && su -s /bin/bash -c "/usr/bin/teamspeak3-server ${TS_ARGS} &> /dev/null &" teamspeak
    if [ $? -gt 0 ]; then
      stat_fail
    else
       add_daemon teamspeak3-server
       stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Teamspeak3-Server"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon teamspeak3-server
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
