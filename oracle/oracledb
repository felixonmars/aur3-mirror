#!/bin/bash
#
# /etc/rc.d/oracledb
#
# Run-level Startup script for the Oracle Listener and Instances
# It relies on the information on /etc/oratab

export ORACLE_BASE=/home/oracle/app/oracle
export ORACLE_HOME=/home/oracle/app/oracle/product/11.1.0/orarch
export ORACLE_OWNR=oracle
export PATH=$PATH:$ORACLE_HOME/bin

if [ ! -f $ORACLE_HOME/bin/dbstart -o ! -d $ORACLE_HOME ]
then
    echo "Oracle startup: cannot start"
    exit 1
fi

case "$1" in
    start)
        # Oracle listener and instance startup
        echo -n "Starting Oracle: "
        su $ORACLE_OWNR -c "$ORACLE_HOME/bin/lsnrctl start"
        su $ORACLE_OWNR -c "$ORACLE_HOME/bin/dbstart $ORACLE_HOME"
        touch /var/lock/oracle
        echo "OK"
        ;;
    stop)
        # Oracle listener and instance shutdown
        echo -n "Shutdown Oracle: "
        su $ORACLE_OWNR -c "$ORACLE_HOME/bin/lsnrctl stop"
        su $ORACLE_OWNR -c "$ORACLE_HOME/bin/dbshut $ORACLE_HOME"
        rm -f /var/lock/oracle
        echo "OK"
        ;;
    reload|restart)
        $0 stop
        $0 start
        ;;
    *)
        echo "Usage: `basename $0` start|stop|restart|reload"
        exit 1
esac

exit 0

