#!/bin/bash
# Copypasta from the ArchWiki and the wicd daemon script

. /etc/rc.conf
. /etc/rc.d/functions

DAEMON=tiitoo-hdmi
COMMAND=$DAEMON-wrapper
PROCESS=$DAEMON-daemon
LOGFILE=/tmp/$DAEMON-daemon.log
tiitoo-hdmi-wrapper() {
  if [ -z $1 ]; then
    echo "Parameter missing. Please edit /etc/conf.d/tiitoo-hdmi if you are using the daemon."
    exit 1
  else
    echo > $LOGFILE
    modprobe i2c-dev
    mv "$1" /dev/i2c-2

    # ensure that the SPDIF audio is on 
    amixer -c0 set "IEC958" on &>> $LOGFILE
    amixer -c0 set "IEC958 Default PCM" on &>> $LOGFILE
    dbus-launch $PROCESS &>> $LOGFILE # the daemon requires a dbus session, meh
  fi
}

[ -r /etc/conf.d/$DAEMON ] && . /etc/conf.d/$DAEMON


case "$1" in
 start)
   stat_busy "Starting $DAEMON"
   pkill -f $PROCESS
   $COMMAND $DEVICE &
   if [ $? = 0 ]; then
     add_daemon $DAEMON
     stat_done
   else
     cat $LOGFILE
     stat_fail
     exit 1
   fi
   ;;
 stop)
   stat_busy "Stopping $DAEMON"
   pkill -f $PROCESS
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
   ;;
esac
