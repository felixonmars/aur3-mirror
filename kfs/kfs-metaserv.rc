#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/kfs

CP_DIR=`cat $KFS_CONF 2>/dev/null | grep metaServer.cpDir | cut -d '=' -f 2 | sed 's/ //g'`
LOG_DIR=`cat $KFS_CONF 2>/dev/null | grep metaServer.logDir | cut -d '=' -f 2 | sed 's/ //g'`

case "$1" in
  start)
    stat_busy "Starting KFS MetaServer"

    [ -z "$KFS_CONF" ] && { echo "KFS_CONF not set. You need to specify it in /etc/conf.d/kfs file"; stat_fail; exit 0; }
    [ -z "$KFS_WEBUI_CONF" ] && { echo "KFS_WEBUI_CONF not set. You need to specify it in /etc/conf.d/kfs file"; stat_fail; exit 0; }
    [ -z "$KFS_DIR" ] && { echo "KFS_DIR not set. You need to specify it in /etc/conf.d/kfs file"; stat_fail; exit 0; }

    [ -f "$KFS_CONF" ] || { echo "$KFS_CONF doesn't exist"; stat_fail; exit 0; }
    [ -f "$KFS_WEBUI_CONF" ] || { echo "$KFS_WEBUI_CONF doesn't exist"; stat_fail; exit 0; }

    [ -d "$KFS_DIR" ] || mkdir -p "$KFS_DIR" || { echo "Could not create $KFS_DIR"; stat_fail; exit 0; }

    [ -z "$CP_DIR" ] && { echo "$KFS_CONF doesn't have metaServer.cpDir set"; stat_fail; exit 0; }
    [ -z "$LOG_DIR" ] && { echo "$KFS_CONF doesn't have metaServer.logDir set"; stat_fail; exit 0; }
    
    cd "$KFS_DIR"

    [ -d "$CP_DIR" ] || mkdir -p "$CP_DIR" || { echo "Could not create $CP_DIR directory"; stat_fail; exit 0; }
    [ -d "$LOG_DIR" ] || mkdir -p "$LOG_DIR" || { echo "Could not create $LOG_DIR directory"; stat_fail; exit 0; }

    [ -d "bin" ] || ln -s /usr/share/kfs/bin || { echo "Could not create link to /usr/share/kfs/bin in $KFS_DIR"; stat_fail; exit 0; }
    [ -d "scripts" ] || ln -s /usr/share/kfs/scripts || { echo "Could not create link to /usr/share/kfs/scripts in $KFS_DIR"; stat_fail; exit 0; }
    [ -d "logs" ] || mkdir -p "logs" || { echo "Could not create $KFS_DIR/logs"; stat_fail; exit 0; }

    if [ ! -d "webui" ]; then
      mkdir -p "webui" || { echo "Could not create webui directory in $KFS_DIR"; stat_fail; exit 0; }
      ( cd webui && ln -s /usr/share/kfs/webui/kfsstatus.py ) || { echo "Could not create link to /usr/share/kfs/webui/kfsstatus.py in $KFS_DIR/webui"; stat_fail; exit 0; }
      ( cd webui && ln -s /usr/share/kfs/webui/files ) || { echo "Could not create link to /usr/share/kfs/webui/files in $KFS_DIR/webui"; stat_fail; exit 0; }
      ( cd webui && ln -s "$KFS_WEBUI_CONF" server.conf ) || { echo "Could not create link to $KFS_WEBUI_CONF in $KFS_DIR/webui"; stat_fail; exit 0; }
    fi

    [ -d "$KFS_DIR/webui/files" ] || { echo "$KFS_DIR/webui/files doesn't exist or is not a directory"; stat_fail; exit 0; }
    [ -e "$KFS_DIR/webui/kfsstatus.py" ] || { echo "$KFS_DIR/webui/kfsstatus.py exist"; stat_fail; exit 0; }
    [ -e "$KFS_DIR/webui/server.conf" ] || { echo "$KFS_DIR/webui/server.conf doesn't exist"; stat_fail; exit 0; }

    if [ -z "$BACKUP_NODE" ]; then
      scripts/kfsrun.sh --start --meta --file "$KFS_CONF"

      ret=$?
    else
      [ -z "$BACKUP_PATH" ] && BACKUP_PATH="."

      # Needed? I'm not sure how backup_path works...
      mkdir -p "$BACKUP_PATH" || { echo "Could not create $BACKUP_PATH directory"; stat_fail; exit 0; }

      echo "Running with BACKUP_NODE=$BACKUP_NODE and BACKUP_PATH=$BACKUP_PATH"

      scripts/kfsrun.sh --start --meta --file "$KFS_CONF" --backup_node "$BACKUP_NODE" --backup_path "$BACKUP_PATH"

      ret=$?
    fi

    if [ $ret -gt 0 ]; then
      stat_fail
    else
      add_daemon kfs-metaserv
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping KFS MetaServer"

    cd "$KFS_DIR"

    if [ -z "$BACKUP_NODE" ]; then
      scripts/kfsrun.sh --stop --meta --file "$KFS_CONF"

      ret=$?
    else
      [ -z "$BACKUP_PATH" ] && BACKUP_PATH="."

      scripts/kfsrun.sh --stop --meta --file "$KFS_CONF" --backup_node "$BACKUP_NODE" --backup_path "$BACKUP_PATH"

      ret=$?
    fi

    if [ $ret -gt 0 ]; then
      stat_fail
    else
      rm_daemon kfs-metaserv
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
