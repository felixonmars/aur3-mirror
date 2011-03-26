#!/bin/bash
#Made by Marcelo A.

# Set to "C" locale so we can parse messages from commands
LANG=C
export LANG
# Must be root
if test "`id -u`" != 0 ; then
    echo "$0: You must be root to run this script" >& 2
    exit 1
fi

ME="`basename $0`"

CONFIG=/etc/ppp/pptp.conf

if [ ! -f "$CONFIG" -o ! -r "$CONFIG" ] ; then
    echo "$ME: Cannot read configuration file '$CONFIG'" >& 2
    exit 1
fi

. $CONFIG

# Ignore SIGTERM
trap "" 15

for i in /etc/ppp/ppp-cable.pid /var/run/ppp-cable.pid ; do
  if [ -r $i ] ; then
     PID=`head -n1 $i`
     #Check if still running
   kill -0 $PID > /dev/null 2>&1
   if [ $? != 0 ] ; then
        echo "$ME: Connection appears to have died (PID $PID)" >& 2
	else 
   #Kill pppd , which should in turn kill pptp
   logger -p daemon.notice "Terminating cable-ppp link"
          echo "Terminating cable-ppp link on pid ($PID),please wait.."
   kill $PID > /dev/null 2>&1
   sleep 4
  fi
  exit 0
  fi	
done    

echo "No active cable connection found"

exit 0
