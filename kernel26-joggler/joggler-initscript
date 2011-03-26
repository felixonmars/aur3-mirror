#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Setting Jogglers hw address"
    if [ $JOGGLER_HWADDR ]; then
       /sbin/ifconfig eth0 hw ether $JOGGLER_HWADDR;
    else
      stat_fail
    fi
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon joggler
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping joggler"
    rm_daemon joggler
    stat_done
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  savetime)
	# Check that the scripts are in place, if not install them
	if [ $(/bin/grep '/etc/rc.d/joggler savetime' /etc/rc.local.shutdown | wc -l) -eq 0 ];then
		echo "/etc/rc.d/joggler savetime" >> /etc/rc.local.shutdown
		echo ">>> Time saving script added to /etc/rc.local.shutdown"
	fi
	if [ $(/bin/grep '/etc/rc.d/joggler loadtime' /etc/rc.sysinit | wc -l) -eq 0 ];then
		/bin/sed s/"FORCEFSCK="/"\/etc\/rc.d\/joggler loadtime\nFORCEFSCK="/ -i /etc/rc.sysinit
		/etc/rc.d/joggler savetime
		echo ">>> Time restoring script added to /etc/rc.sysinit"
	fi

	# Store time
	MD=$(/bin/date +%m%d)
	MIN=$(/bin/date +%M)
	YEAR=$(/bin/date +%Y)
	HOUR=$(/bin/date +%H)
	HOUR=$(expr $HOUR + 1)
	if [ $HOUR -gt 23 ];then
		HOUR="00"	
	fi
	if [ $(/bin/echo -n $HOUR|/usr/bin/wc -c) -eq 1 ];then
		HOUR=$(/bin/echo -n "0$HOUR")
	fi
	echo "$MD$HOUR$MIN$YEAR" > /.datetime
	sync
    ;;
  loadtime)
	# Restore time
	if [ -e /.datetime ]; then
		/bin/date $( < /.datetime)
	fi
    ;;
  *)
    echo "usage: $0 {start|stop|restart|savetime|loadtime}"  
esac
exit 0
