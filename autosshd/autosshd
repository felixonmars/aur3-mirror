#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/autosshd

PIDDIR="/var/run/autosshd"
[ -d "$PIDDIR" ] || mkdir -p $PIDDIR
PIDFILE="$PIDDIR/autosshd.pid"
PID=$(cat "$PIDFILE" 2>/dev/null)

case "$1" in
  start)
    stat_busy "Starting autossh"
    [ "$AUTOSSH_USER" == "" ] || chown -R $AUTOSSH_USER $PIDDIR
    [ -z "$PID" ] && sudo -u $AUTOSSH_USER env AUTOSSH_PIDFILE="$PIDFILE" /usr/bin/autossh -M $AUTOSSH_PORT -f $SSH_OPTIONS
    if [ $? -gt 0 ]; then
      stat_die
    else
      add_daemon autosshd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping autossh"
    if [ -n "$PID" ]; then
      kill $PID &> /dev/null
      if [ $? -gt 0 ]; then
        stat_die
      else
        rm_daemon autosshd
        stat_done
      fi
    else
      stat_die
    fi
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  status)
    if [ -z "$PID" ]; then
      status_stopped
    else
      status_started
    fi
    ;;
  *)
    echo "usage: $0 {start|stop|status|restart}"
esac
exit 0
