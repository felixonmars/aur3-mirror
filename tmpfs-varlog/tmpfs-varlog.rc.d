#!/bin/bash

# set for script debugging
#set -x

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/tmpfs-varlog.conf


# determine if /var/log is mounted on a tmpfs file system
varlog_on_tmpfs() {
	mount -t tmpfs | grep -q "/var/log"
	if [ $? -eq 0 ]; then
		return 1;
	else
		return 0;
	fi
}

case "$1" in
  start)
    varlog_on_tmpfs
    if [ $? -eq 1 ]; then
      stat_busy "Restoring tmpfs /var/log"
      tar -x -S -z --atime-preserve -f $TFSVL_ARC_DIR/$TFSVL_ARC_FN\
	-C $TFSVL_ARC_EXTRACT_DST > /dev/null 2>&1
      if [ $? -eq 0 ]; then
              add_daemon tmpfs-varlog 
	      stat_done
      else
              stat_fail
      fi
    fi
    ;;
  stop)
    varlog_on_tmpfs 
    if [ $? -eq 1 ]; then
      stat_busy "Backing up tmpfs /var/log"
      mkdir -p $TFSVL_ARC_DIR
      tar -c -S -z --atime-preserve -f $TFSVL_ARC_DIR/$TFSVL_ARC_FN /var/log\
	> /dev/null 2>&1
      if [ $? -eq 0 ]; then
              rm_daemon tmpfs-varlog 
	      stat_done
      else
              stat_fail
      fi
    fi
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
