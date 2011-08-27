#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/kfs

CHUNK_DIR=`cat $KFS_CONF 2>/dev/null | grep chunkServer.chunkDir | cut -d '=' -f 2 | sed 's/ //g'`
LOG_DIR=`cat $KFS_CONF 2>/dev/null | grep chunkServer.logDir | cut -d '=' -f 2 | sed 's/ //g'`

case "$1" in
  start)
    stat_busy "Starting KFS ChunkServer"

    [ -z "$KFS_CONF" ] && { echo "KFS_CONF not set. You need to specify it in /etc/conf.d/kfs file"; stat_fail; exit 0; }
    [ -z "$KFS_DIR" ] && { echo "KFS_DIR not set. You need to specify it in /etc/conf.d/kfs file"; stat_fail; exit 0; }

    [ -f "$KFS_CONF" ] || { echo "$KFS_CONF doesn't exist"; stat_fail; exit 0; }
    [ -d "$KFS_DIR" ] || mkdir -p "$KFS_DIR" || { echo "Could not create $KFS_DIR"; stat_fail; exit 0; }

    [ -z "$CHUNK_DIR" ] && { echo "$KFS_CONF doesn't have chunkServer.chunkDir set"; stat_fail; exit 0; }
    [ -z "$LOG_DIR" ] && { echo "$KFS_CONF doesn't have chunkServer.logDir set"; stat_fail; exit 0; }
    
    cd "$KFS_DIR"

    [ -d "$CHUNK_DIR" ] || mkdir -p "$CHUNK_DIR" || { echo "Could not create $CHUNK_DIR directory"; stat_fail; exit 0; }
    [ -d "$LOG_DIR" ] || mkdir -p "$LOG_DIR" || { echo "Could not create $LOG_DIR directory"; stat_fail; exit 0; }

    [ -d "bin" ] || ln -s /usr/share/kfs/bin || { echo "Could not create link to /usr/share/kfs/bin in $KFS_DIR"; stat_fail; exit 0; }
    [ -d "scripts" ] || ln -s /usr/share/kfs/scripts || { echo "Could not create link to /usr/share/kfs/scripts in $KFS_DIR"; stat_fail; exit 0; }
    [ -d "logs" ] || mkdir -p "logs" || { echo "Could not create $KFS_DIR/logs"; stat_fail; exit 0; }

    scripts/kfsrun.sh --start --chunk --file "$KFS_CONF"

    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon kfs-chunkserv
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping KFS ChunkServer"

    cd "$KFS_DIR"

    scripts/kfsrun.sh --stop --chunk --file "$KFS_CONF"

    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon kfs-chunkserv
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
exit 0
