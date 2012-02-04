#!/bin/sh
BASE=$HOME/.config/dwmd
PIDFILE=$BASE/pid
LOGFILE=$BASE/log

[ -d $BASE ] || mkdir -p $BASE

case $1 in
  start)
    if [ -e $PIDFILE ]; then
      printf "DWM is already running.\n"
      exit
    fi

    echo "$$" > $PIDFILE
    while true; do
      dwm 2> $LOGFILE
    done
    ;;
  stop)
    if [ -e $PIDFILE ]; then
      kill `cat $PIDFILE`
      rm $PIDFILE
    else
      printf 'DWM is not running\n'
    fi
    ;;
  *)
    printf "Usage: $0 [start|stop]\n"
    ;;
esac
