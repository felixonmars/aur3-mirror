#!/bin/bash

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
NAME=compcache
DESC=Compcache
LOG_FILE=/var/log/compcache.log
CONF_FILE=/etc/conf.d/compcache

# defaults
swap_arg=""
size_arg=""
DEVICES_COUNT=1
SIZE=$(($(free | grep Mem | awk '{ print $2 }') / 4))

# import system functions
. /etc/rc.conf
. /etc/rc.d/functions

# Include compcache defaults if available
if [ -f $CONF_FILE ] ; then
  . $CONF_FILE

  # if DEVICES_COUNT not defined or if with ilegal value, resetting to default
  if ! [ -n $DEVICES_COUNT -a $DEVICES_COUNT -ge 1 -a $DEVICES_COUNT -le 4 ]; then
    DEVICES_COUNT=1
  fi
fi

case "$1" in
  start)
    stat_busy "Starting $DESC "
    if grep -vq zram /proc/swaps; then
      modprobe zram zram_num_devices=$DEVICES_COUNT >> $LOG_FILE 2>&1
    fi

    sleep 0.1

    # initiating devices
    for ((i=1; i<=DEVICES_COUNT; ++i)) ; do
      echo "initiating device" $(($i -1)) >> $LOG_FILE 2>&1
      $(echo $(($SIZE*1024/$DEVICES_COUNT)) > /sys/block/zram$(($i-1))/disksize) >> $LOG_FILE 2>&1
      mkswap /dev/zram$(($i-1)) >> $LOG_FILE 2>&1 || return 1
      swapon -p 10 /dev/zram$(($i-1)) >> $LOG_FILE 2>&1 || return 1
    done

    if [ $? -gt 0 ]; then
      stat_fail
    else
      stat_done
      add_daemon compcache
    fi
  ;;
  stop)
    stat_busy "Stopping $DESC "

    for DVC in `grep -o '/dev/zram[0-9]*' /proc/swaps`; do
      echo "swapoff $DVC" >> $LOG_FILE
      swapoff $DVC >> $LOG_FILE 2>&1
      echo 1 > /sys/block/`basename $DVC`/reset
    done

    sleep 0.1

    rmmod zram >> $LOG_FILE 2>&1

    if [ $? -gt 0 ];then
      stat_fail
    else
      stat_done
      rm_daemon compcache
    fi
  ;;
  restart)
    $0 stop
    sleep 1
    $0 start
  ;;
  status)
    if grep -q zram /proc/swaps; then
      echo "Compcache activated."
    else
      echo "Compcache not activated."
    fi
  ;; 
  *)
    echo "Usage: $0 {start|stop|restart|status}" >&2
    exit 1
  ;;
esac

exit 0
