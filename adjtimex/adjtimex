#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

# default values
TICK=10000
FREQ=0
 
# values in $cfg take precedence over the values here
cfg=/etc/default/adjtimex

if [ -f $cfg ]; then
  . $cfg
fi

prog="adjtimex"

case "$1" in
start|restart)
  echo -n "Regulating system clock..."
  /sbin/$prog -tick "$TICK" -frequency "$FREQ"
  echo "done."
  ;;
stop)
  ;;
*)
  echo "usage: $prog [start|stop|restart]"
esac
