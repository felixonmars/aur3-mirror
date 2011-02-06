#!/bin/bash

. /etc/rc.vdr

ACPIALARM=/proc/acpi/alarm
TIMER="$1"

if [ "$TVM2VDRWAKEUP" == "yes" ]; then
# when is the next time TVM2VDRHOUR
  night=`date -d "$TVM2VDRHOUR:00" +%s`
  if [ $night -lt `date +%s` ]; then
    night=$(( $night + 24*60*60 ))
  fi
  
  if [ -n "$TIMER" ]; then
    if [ "$TIMER" -ne "0" ]; then
#     what is next: Timer or TVM2VDRHOUR?
      if [ $night -lt $TIMER ]; then
        BOOTTIME=$((night+120))
      else 
        BOOTTIME=$TIMER
      fi
    else
      BOOTTIME=$((night+120))
    fi
  else
    BOOTTIME=$((night+120))
  fi
else
  BOOTTIME="$TIMER"
fi

if [ -n "$BOOTTIME" ]; then
  if [ "$BOOTTIME" -ne "0" ]; then
    date -u -d "1970-01-01 UTC $((BOOTTIME-120)) seconds" +"%Y-%m-%d %R:%S" >> /var/log/vdrshutdown.log
    date -u -d "1970-01-01 UTC $((BOOTTIME-120)) seconds" +"%Y-%m-%d %R:%S" > $ACPIALARM
  fi
fi

halt
