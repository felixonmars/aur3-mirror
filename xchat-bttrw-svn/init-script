#!/bin/bash

[ -f /etc/conf.d/xchat-bttrw ] && . /etc/conf.d/xchat-bttrw

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/bin/xchat-bttrw`

case "$1" in
  start)
    stat_busy "Starting xchat-bttrw"
    PARAMS=""

    if [ -z "$PORT" ]; then
#	    msg "You must set PORT variable in /etc/conf.d/xchat-bttrw!"
	    stat_fail
	    exit
    else
	    PARAMS="$PARAMS --port $PORT"
    fi

    if [ "$PROXYHOST" ] && [ "$PROXYPORT" ]; then
#	    msg "Using proxu $PROXYHOST:$PROXYPORT"
	    export PROXYHOST="$PROXYHOST"
	    export PROXYPORT="$PROXYPORT"
    fi

    if [ "$BIND" ]; then PARAMS="$PARAMS --bind $BIND"; fi
    if [ "$LOG" ]; then PARAMS="$PARAMS --log $LOG"; fi
    if [ "$RESTRICT" ]; then
	    PARAMS="$PARAMS --resctrict $RESTRICT"
    fi

    /usr/bin/xchat-bttrw $PARAMS &> /dev/null &

    if [ $? -gt 0 ]; then
	    stat_fail
    else
	    add_daemon xchat-bttrw
	    stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping xchat-bttrw"
    [ ! -z "$PID" ] && kill $PID &> /dev/null

    if [ $? -gt 0 ]; then
	    stat_fail
    else
	    rm_daemon xchat-bttrw
	    stat_done
    fi
    ;;
  stopall)
    $0 stop
    killall xchat-bttrw
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|stopall|restart}"
esac
exit 0
