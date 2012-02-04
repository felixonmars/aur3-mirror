#!/bin/bash
#
# CCcam 2.0.9 - Cardsharing server
#
# Author:	Peque
# Date:		22.10.2008
#

. /etc/rc.conf			# include rc.conf scripts
. /etc/rc.d/functions		# include functions script

PID=`pidof -o %PPID /usr/cccam/CCcam.x86` 
# Starting the server
case "$1" in
  start)
    stat_busy "Starting CCcam-2.0.9 server"
    /emu/cccam/CCcam.x86 -C /etc/CCcam.cfg &
    if [ $? -gt 0 ];then
	stat_fail
    else
	echo $PID > /var/run/cccam.pid
	add_daemon cccamd
	stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping CCcam-2.0.9 server"
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
	stat_fail
    else
	rm_daemon cccamd
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

