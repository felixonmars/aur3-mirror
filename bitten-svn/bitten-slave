#!/bin/sh

# This script supports multiple slaves in parallel with
# different configurations. Simply create a symlink from
# bitten-slave to bitten-foo, add the configuration in
# /etc/conf.d/bitten-foo and add bitten-foo to the DAEMONS
# variable in rc.conf.

DAEMON_NAME=$(basename $0)

# general config
. /etc/rc.conf
. /etc/rc.d/functions
[ -f /etc/conf.d/$DAEMON_NAME ] && . /etc/conf.d/$DAEMON_NAME

: ${BITTEN_USER:="bitten-slave"}
: ${BITTEN_URL:="http://localhost/trac/builds"}

getpid() {
   NAME="$1"
   : ${NAME:="$DAEMON_NAME"}
   PATTERN="$2"
   : ${PATTERN:="$NAME"}
   if [ -f /var/run/daemons/$NAME ]; then
      PID=$(cat /var/run/daemons/$NAME)
      if [ -f /proc/$PID/cmdline ] && grep -q "$PATTERN" /proc/$PID/cmdline; then
         echo $PID
      else
         echo -1
      fi
   else
      echo -1
   fi
}

start() {
   cd /home/$BITTEN_USER
   nice setsid sudo -u $BITTEN_USER LANG=C HOME=/home/$BITTEN_USER USER=$BITTEN_USER LOGNAME=$BITTEN_USER bitten-slave $BITTEN_OPTS "$BITTEN_URL" > /var/log/$DAEMON_NAME.log 2>&1 &
   PID=$!
   sleep 1
   if [ -f /proc/$PID/cmdline ] && grep -q bitten-slave /proc/$PID/cmdline; then
      echo $PID > /var/run/daemons/$DAEMON_NAME
      return 0
   else
      return 1
   fi
}

stop() {
   PID=$(getpid $DAEMON_NAME "$BITTEN_URL")
   if [ $PID -gt 0 ]; then
      kill -TERM -$PID
      count=0
      while [ $count -lt 5 ] && [ $(getpid $DAEMON_NAME "$BITTEN_URL") -gt 0 ]; do
         sleep 1
         count=$(expr $count + 1)
      done
      if [ $(getpid $DAEMON_NAME "$BITTEN_URL") -gt 0 ]; then
         kill -KILL -$PID
      fi
      rm -f /var/run/daemons/$DAEMON_NAME
   fi
}

case "$1" in
start)
   stat_busy "Starting $DAEMON_NAME: "
   if [ $(getpid $DAEMON_NAME "$BITTEN_URL") -gt 0 ]; then
      stat_done
   else
      if start; then
         stat_done
      else
         stat_fail
      fi
   fi
   ;;
status)
   PID=$(getpid $DAEMON_NAME "$BITTEN_URL")
   if [ $PID -gt 0 ]; then
      echo $DAEMON_NAME is running with PID $PID.
      exit 0
   else
      echo $DAEMON_NAME is stopped.
      exit 1
   fi
   ;;
stop)
   stat_busy "Shutting down $DAEMON_NAME: "
   stop
   stat_done
   ;;
reload)
   stop
   if ! start; then
      echo Failed to restart $DAEMON_NAME >&2
   fi
   ;;
restart)
   $0 stop
   $0 start
   ;;
cond-restart)
   if [ $(getpid $DAEMON_NAME "$BITTEN_URL") -gt 0 ]; then
      stop
      if ! start; then
         echo Failed to restart $DAEMON_NAME >&2
      fi
   fi
   ;;
*)
   echo "Usage: $0 {start|stop|status|restart|reload|cond-restart}"
esac 
