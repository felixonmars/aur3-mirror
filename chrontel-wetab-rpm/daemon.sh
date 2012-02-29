#!/bin/bash
# Copypasta from the ArchWiki

. /etc/rc.conf
. /etc/rc.d/functions

DAEMON=tiitoo-hdmi
DEVICE=
LOGFILE=/tmp/tiitoo-hdmi-$USER.log
PID=$(get_pid $DAEMON)

[ -r /etc/conf.d/$DAEMON ] && . /etc/conf.d/$DAEMON

daemon_wrapper() {


  modprobe i2c-dev
  mv "$1" /dev/i2c-2

  # ensure that the SPDIF audio is on 
  amixer -c0 set "IEC958" on
  amixer -c0 set "IEC958 Default PCM" on

  tiitoo-hdmi-daemon
}



case "$1" in
 start)
   stat_busy "Starting $DAEMON"
   [[ -z $1 ]] &&
     echo "Please edit /etc/conf.d/tiitoo-hdmi" &&
     exit 1
   [ -z "$PID" ] && daemon_wrapper $DEVICE &>/tmp/tiitoo-hdmi-$USER.log
   if [ $? = 0 ]; then
     add_daemon $DAEMON
     stat_done
   else
     cat /tmp/tiitoo-hdmi-$USER.log
     stat_fail
     exit 1
   fi
   ;;
 stop)
   stat_busy "Stopping $DAEMON"
   [ -n "$PID" ] && kill $PID &>/dev/null
   if [ $? = 0 ]; then
     rm_daemon $DAEMON
     stat_done
   else
     stat_fail
     exit 1
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
