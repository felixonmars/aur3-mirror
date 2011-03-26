#!/bin/bash
#Made by Marcelo A.
#
#***********************************************************************

# Defaults
CONFIG=/etc/ppp/pptp.conf


if [ ! -f "$CONFIG" -o ! -r "$CONFIG" ] ; then
    echo "$0: Cannot read configuration file '$CONFIG'" >& 2
    exit 1
fi

. $CONFIG


# If no PPPD_PIDFILE, something fishy!
if [ ! -r "/etc/ppp/ppp-cable.pid" ] && [ ! -r "/var/run/ppp-cable.pid" ] ; then
    echo "cable-status: Link is down (can't read pppd PID file )"
    exit 1
fi


# Sigh.  Some versions of pppd put PID files in /var/run; others put them
# in /etc/ppp.  Since it's too messy to figure out what pppd does, we
# try both locations.
for i in /etc/ppp/ppp-cable.pid /var/run/ppp-cable.pid ; do
    if [ -r $i ] ; then
	IF=`tail -1 $i`
	    netstat -rn | grep "$IF" > /dev/null
	     /sbin/ifconfig $IF | grep "UP.*POINTOPOINT" > /dev/null
	    if [ "$?" != "0" ] ; then
		echo "cable-status: Link is attached to $IF, but $IF is down"
		exit 1
	    fi
	    echo "cable-status: Link is up and running on interface $IF"
	    /sbin/ifconfig $IF
	    exit 0
	
    fi
done

echo "cable-status: Link is down"
exit 1
