#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

MARARCS="/etc/mararc"

PID=`ps alx | awk '$13 !~ "duende" && $13 ~ "maradns" { print $3 }'`

case "$1" in
start)
stat_busy "Starting maradns Daemon"
if [ -z "$PID" ]; then
/usr/bin/duende /usr/sbin/maradns -f $MARARCS 2>&1 & > /dev/null
fi
if [ ! -z "$PID" -o $? -gt 0 ]; then
stat_fail
else
add_daemon maradns
stat_done
fi
;;
stop)
stat_busy "Stopping maradns Daemon"
[ ! -z "$PID" ] && kill -TERM $PID &> /dev/null
if [ $? -gt 0 ]; then
stat_fail
else
rm_daemon maradns
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
