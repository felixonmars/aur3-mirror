#!/bin/bash
#
# portsentry Start the portsentry portscan detector
# Authors: Craig Rowland , Tim Powers
# and Matthias Saou
# modyfied by Janek 'benetnash' Polak <starbreaker@op.pl> 
# configfile: /etc/portsentry/portsentry.conf
# pidfile: /var/run/portsentry.pid

# Source function library.
. /etc/rc.conf
. /etc/rc.d/functions

# Check that networking is up.
if ck_daemon network; then
   echo "Cannot run portsentry without network - run network first"
   exit
fi

# For this script to work on non english systems
export LANG=C

RETVAL=0

start () {
  if ! ck_daemon portsentry; then
    echo "portsentry is already running. Try 'portsentry restart'"
    exit
  fi	
  stat_busy "Starting portsentry"
  # Set up the ignore file
  SENTRYDIR=/etc/portsentry/
  FINALIGNORE=$SENTRYDIR/portsentry.ignore
  TMPFILE=/tmp/portsentry.ignore.tmp
  # Testline is used to see if the initscript has already been run
  if [ -f $FINALIGNORE ] ; then
   cp -f $FINALIGNORE $TMPFILE
   testline=`grep -n "Do NOT edit below this" $TMPFILE | cut --delimiter=":" -f1`
   if [ -z "$testline" ] ; then
    echo > /dev/null # Do nothing
   else
    let headline=$testline-2
    head -$headline $FINALIGNORE > $TMPFILE
   fi
  fi
  echo '#########################################' >> $TMPFILE
  echo '# Do NOT edit below this line, if you #' >> $TMPFILE
  echo '# do, your changes will be lost when #' >> $TMPFILE
  echo '# portsentry is restarted via the #' >> $TMPFILE
  echo '# initscript. Make all changes above #' >> $TMPFILE
  echo '# this box. #' >> $TMPFILE
  echo '#########################################' >> $TMPFILE

  echo '' >> $TMPFILE
  echo '# Exclude all local interfaces' >> $TMPFILE
  for i in `/sbin/ifconfig -a | grep inet | awk '{print $2}' | sed 's/addr://'` ; do
    echo $i >> $TMPFILE
  done

  echo '' >> $TMPFILE
  echo '# Exclude the default gateway(s)' >> $TMPFILE
  for i in `/sbin/route -n | grep ^0.0.0.0 | awk '{print $2}'` ; do
    echo $i >> $TMPFILE
  done

  echo '' >> $TMPFILE
  echo '# Exclude the nameservers' >> $TMPFILE
  for i in `/bin/cat /etc/resolv.conf | grep ^nameserver | awk '{print $2}'` ; do
   echo $i >> $TMPFILE
  done

  echo '' >> $TMPFILE
  echo '# And last but not least...' >> $TMPFILE
  echo '0.0.0.0' >> $TMPFILE
  echo '' >> $TMPFILE

  cp -f $TMPFILE $SENTRYDIR/portsentry.ignore
  rm -f $TMPFILE

  # Check for modes defined in the config file
  if [ -s $SENTRYDIR/portsentry.modes ] ; then
   modes=`cut -d "#" -f 1 $SENTRYDIR/portsentry.modes`
  else
   modes="tcp udp"
  fi
  for i in $modes ; do
   /usr/sbin/portsentry -$i
   RETVAL=$?
  done
  if [ $RETVAL -eq 0 ]; then
     add_daemon portsentry
     stat_done
  else
     stat_fail
  fi
  return $RETVAL
 }

stop() {
  stat_busy "Stopping portsentry"
  # Set up the ignore file
  killall -q -e /usr/sbin/portsentry
  RETVAL=$?
  if [ $RETVAL -eq 0 ]; then
     rm_daemon portsentry
     stat_done
  else
     stat_fail
  fi
  return $RETVAL
  }

# See how we were called.
case $1 in	
  start)
   start
   ;;
  stop)
   stop
   ;;
  status)
   status portsentry
   RETVAL=$?
   ;;
  restart)
   stop
   start
   RETVAL=$?
   ;;
  condrestart)
    if [ -f /var/lock/subsys/portsentry ]; then
     stop
     start
     RETVAL=$?
    fi
    ;;
  *)
  echo $"Usage: portsentry {start|stop|restart|condrestart|status}"
  exit 1
 esac

exit $RETVAL
