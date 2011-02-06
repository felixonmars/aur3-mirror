#!/bin/bash

# set for script debugging
#set -x

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/tmpfs-store


# determine if specified file system is mounted on a tmpfs file system
fs_on_tmpfs() {
	mount -t tmpfs | grep -q "$1"
	if [ $? -eq 0 ]; then
		return 1;
	else
		return 0;
	fi
}


case "$1" in
  start)
    stat_busy "Restoring tmpfs file systems"
    for i in $TFSST_FSES; do
    	fs_on_tmpfs $i
        if [ $? -eq 1 ]; then
          tar -x -S -z --atime-preserve\
            -f $TFSST_ARC_DIR/`echo $i | tr "/" "."`.tar.gz \
            -C $TFSST_ARC_EXTRACT_DST > /dev/null 2>&1
        fi
    done;
    add_daemon tmpfs-store 
    stat_done
    ;;
  stop)
    stat_busy "Backing up tmpfs file systems"
    mkdir -p $TFSST_ARC_DIR
    for i in $TFSST_FSES; do
      tar -c -S -z --atime-preserve \
        -f $TFSST_ARC_DIR/`echo $i | tr "/" "."`.tar.gz \
        $i > /dev/null 2>&1
    done
    rm_daemon tmpfs-store 
    stat_done
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
