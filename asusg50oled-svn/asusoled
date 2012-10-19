#!/bin/bash
. /etc/rc.d/functions

name=asusoled
PID=$(pgrep -f "jar leds.jar")
OLEDPATH=/opt/asusg50oled
case "$1" in
  start)
        stat_busy "Starting $name daemon"
	cd $OLEDPATH
	[ -z "$PID" ] && /usr/bin/java -Xmx8m -Xms8m -Djava.awt.headless=true -Djava.security.policy=policy.all -jar leds.jar &>/dev/null &
    	if [ $? -gt 0 ]; then
      		stat_fail
    	else
      		add_daemon $name
      		stat_done
    	fi
    	;;
  stop)
    	stat_busy "Stopping $name Daemon"
    	[ ! -z "$PID" ] && kill -HUP $PID &> /dev/null; sleep 0.1; kill -TERM $PID &> /dev/null
    	if [ $? -gt 0 ]; then
      		stat_fail
    	else
      		rm_daemon $name
      		stat_done
    	fi
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  *)
    echo "usage: $0 start|stop|restart"
esac
exit 0
