#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/postgresql84

PG_CTL="/usr/${_PQDIR}/bin/pg_ctl $PGOPTS -D $PGROOT/data -l /var/log/postgresql84.log -s -w"

case "$1" in
  start)
    stat_busy "Starting PostgreSQL 8.4"
    # initialization
    if [ ! `egrep '^postgres:' /etc/group` ]; then
      stat_busy "Adding postgres group"
      groupadd -g 88 postgres
      stat_done
    fi
    if [ ! `egrep '^postgres:' /etc/passwd` ]; then
      stat_busy "Adding postgres user"
      useradd -u 88 -g postgres -d $PGROOT -s /bin/bash postgres
      [ -d $PGROOT ] && chown -R postgres.postgres $PGROOT
      stat_done
    fi
    if [ ! -d $PGROOT ]; then
      mkdir -p $PGROOT/data && chown -R postgres.postgres $PGROOT
      su - postgres -c "/usr/${_PQDIR}/bin/initdb $INITOPTS -D $PGROOT/data"
    fi
    if [ ! -e /var/log/postgresql84.log ]; then
      touch /var/log/postgresql84.log
      chown postgres /var/log/postgresql84.log
    fi
    # start the process
    su - postgres -c "$PG_CTL start"
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon postgresql84
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping PostgreSQL 8.4"
    su - postgres -c "$PG_CTL stop -m fast"  
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon postgresql84
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 3
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
exit 0
