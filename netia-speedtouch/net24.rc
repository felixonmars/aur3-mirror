#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
   start)
       stat_busy "Startuje NET24..."
       sync=$(dmesg | grep 'ADSL line is up')
       if [ -z "$sync" ]; then
          # override problems on some machines
          modprobe -r speedtch && modprobe speedtch
       fi
       count=0
       while [[ $((count++)) -lt 40 ]]; do
         sync=$(dmesg | grep 'ADSL line is up')
         if [ ! -z "$sync" ]; then
             br2684ctl -b -c 0 -a 8.35 >/dev/null
             sleep 3
             ifconfig nas0 192.168.0.1 netmask 255.255.255.0 up
             sleep 10
             pppd call net24
             stat_done
             exit 0
         fi
         sleep 1
       done
       stat_fail
       ;;
   stop)
       stat_busy "Zatrzymuje NET24..."
       killall -KILL br2684ctl &>/dev/null
       killall -KILL pppd &>/dev/null
       if [ $? -gt 0 ]; then
          stat_fail
       else
          ifconfig nas0 down
          stat_done
       fi
       ;;
   restart)
       $0 stop
       sleep 1
       $0 start
       ;;
   *)
       echo $"Usage: $0 {start|stop|restart}"
       exit 1
       ;;
esac
exit 0

