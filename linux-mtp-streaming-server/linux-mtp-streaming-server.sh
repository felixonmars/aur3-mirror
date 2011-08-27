#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/bin/linux_mtp_streaming_server`
case "$1" in
  start)
  stat_busy "Starting Dovecot"
    # modify "-i /srv/http/linux_mtpcenter_2.0" path for you local setup; -d -D for debug logging
    [ -z "$PID" ] && /usr/bin/linux_mtp_streaming_server -d -P /var/run \
                     -p /etc/linux-mtp-streaming-server -i /srv/http/linux_mtpcenter_2.0 -l /srv/http/linux_mtpcenter_2.0/temp/> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon linux_mtp_streaming_server
      stat_done
    fi
    ;;
  stop)
  stat_busy "Stopping Dovecot"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon linux_mtp_streaming_server
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 2
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
exit 0
