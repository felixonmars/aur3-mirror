#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

ZFS_IMPORT=("-a")
ZFS_MOUNT=("-a")
ZFS_DELAY=1

[ -f /etc/conf.d/zfs-fuse ] && . /etc/conf.d/zfs-fuse

case "$1" in
  start)
  stat_busy "Starting ZFS daemon"
  PID=`pidof -o %PPID /usr/sbin/zfs-fuse`
  if [ -z "$PID" ]; then
    if [ -e /var/run/zfs-fuse.pid ]; then
      rm /var/run/zfs-fuse.pid
      /usr/sbin/zfs-fuse -p /var/run/zfs-fuse.pid

      # wait for zfs-fuse daemon to come up
      sleep $ZFS_DELAY;

      if [ ${#ZFS_IMPORT} -ne 0 ]; then
        for dataset in ${ZFS_IMPORT[@]}; do
          /usr/sbin/zpool import "$dataset"
        done
      fi
      if [ ${#ZFS_MOUNT} -ne 0 ]; then
        for dataset in ${ZFS_MOUNT[@]}; do
          /usr/sbin/zfs mount "$dataset"
        done
      fi

      add_daemon zfs-fuse
      stat_done
    else
      /usr/sbin/zfs-fuse -p /var/run/zfs-fuse.pid

      # wait for zfs-fuse daemon to come up
      sleep $ZFS_DELAY;

      if [ ${#ZFS_IMPORT} -ne 0 ]; then
        for dataset in ${ZFS_IMPORT[@]}; do
          /usr/sbin/zpool import "$dataset"
        done
      fi
      if [ ${#ZFS_MOUNT} -ne 0 ]; then
        for dataset in ${ZFS_MOUNT[@]}; do
          /usr/sbin/zfs mount "$dataset"
        done
      fi

      add_daemon zfs-fuse
      stat_done
    fi
  else
    stat_append "- ZFS daemon seems to be running!"
    stat_done
  fi
  ;;
  stop)
  stat_busy "Stopping ZFS daemon"

  /usr/sbin/zfs unmount -a
  for pool in $(/usr/sbin/zpool list -o name | /bin/grep -v NAME); do
    /usr/sbin/zpool export "$pool" 2>/dev/null
  done

  PID=`pidof -o %PPID /usr/sbin/zfs-fuse`
  kill $PID &>/dev/null
  if [ $? -gt 0 ]; then
    stat_fail
  fi
  if [ -e /var/run/zfs-fuse.pid ]; then
    rm /var/run/zfs-fuse.pid
    rm_daemon zfs-fuse
    stat_done
  else
    rm_daemon zfs-fuse
    stat_done
  fi
  ;;
  restart)
  $0 stop
  sleep 5
  $0 start
  ;;
  *)
  echo "usage: $0 {start|stop|restart}"
esac
exit 0
