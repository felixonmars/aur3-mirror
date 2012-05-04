#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

#From avgdinit.conf
. /opt/avg/av/etc/init.d/avgdinit.conf


# From functions.common

# wait until avgd pid-file exist or time's out
# if time's out, kill avgd and his childern
wait_and_kill()
{
	# print count-down limit
	printf "\r"
	dist_echo_stop_begin
	i=$AVG_WAIT_FOR_PID_TIME
	while [ $i -gt 0 ]
	do
	  i=`expr $i - 1`
	  echo -n " "
	done
	echo -n "|"
	printf "\r"
	dist_echo_stop_begin

	# wait until pid-file exist or time's out
	i=$AVG_WAIT_FOR_PID_TIME
	while [ $i -gt 0 ]
	do
     if [ -f "$AVG_PID_FILE" ] ; then	
		 echo -n "."
	    i=`expr $i - 1`
       sleep 2s
	  else 
       i=0
	  fi
	done

	# if avgd is still running, kill it and all his childern (ps ppid==pid avgd)
   if [ -f "$AVG_PID_FILE" ] ; then	
	  PID=`cat "${AVG_PID_FILE}"`
	  PIDS=`ps axopid,ppid,ruser | grep -w $PID | grep -w $SUSER | awk '{print $1}' | tr '\n' ' '`
	  if [ -n "$PIDS" ] ; then
	    printf "\r killing $AVG_DAEMON and his components with pids: ($PIDS)"
	    kill -KILL $PIDS
	    RETVAL=$?
       [ $RETVAL -eq 0 ] && rm -f $AVG_PID_FILE
	  else
	    RETVAL=2
	  fi
     sleep 2s
	fi
	return $RETVAL
}


# Return values are LSB-compliant.
# Should set the value of RETVAL to return value.
dist_status() 
{
    if [ -f "$AVG_PID_FILE" ] ; then
      PID=`cat "${AVG_PID_FILE}"`
	   ISRUN=`ps axo pid,comm | grep -w $PID | grep -w ${AVG_DAEMON}`
      if [ -n "$ISRUN" ] ; then
	     echo -n "(pid $PID) is running"
        RETVAL=0
      else
	     echo -n "$AVG_DAEMON dead but pidfile exists"
	     RETVAL=1
      fi	
    elif [ -n "$AVG_LOCK_FILE" -a -f "$AVG_LOCK_FILE" ] ; then
	   echo -n "${AVG_DAEMON} dead but subsys locked"
	   RETVAL=2
    else 
	   echo -n "$AVG_DAEMON is not running"
	   RETVAL=3
    fi
    return $RETVAL
}


# Should set the value of RETVAL to return value.
dist_reload() 
{
	#TODO: avgctl --reload
   if [ -f "$AVG_PID_FILE" ] ; then
   kill -HUP `cat "${AVG_PID_FILE}"`
	RETVAL=0
    else	
	RETVAL=7  # program is not running (LSB specification)
	echo -n "service not running"
    fi
    return $RETVAL
}


# Stops the daemon (and waits until his pidfile is removed).
# Should set the value of RETVAL to return value.

dist_stop()
{
   if [ -f "$AVG_PID_FILE" ] ; then	
	  $AVG_CTL --stop >/dev/null 2>&1
	  RETVAL=$?
     if [ -f "$AVG_PID_FILE" ] ; then
	    PID=`cat $AVG_PID_FILE`
	    ISRUN=`ps axo pid,comm | grep -w $PID | grep -w ${AVG_DAEMON}`
	    [ -n "${ISRUN}" ] && wait_and_kill
		 RETVAL=$?
	  fi
   else
	  echo -n " (not running)"
	  RETVAL=0
   fi

   return $RETVAL
}


# Should set the value of RETVAL to return value.
# Note: Used for FreeBSD currently.

dist_start()
{
	# if daemon is not running, nothing should be in RUN_DIR
   if [ -n "`ls $AVG_RUN_DIR`" ] ; then
	  # See if it's already running.
     if [ -f "$AVG_PID_FILE" ] ; then
	    PID=`cat $AVG_PID_FILE`
	    ISRUN=`ps axo pid,comm | grep -w $PID | grep -w ${AVG_DAEMON}`
	    if [ -n "${ISRUN}" ] ; then
	      #avgd is running = do nothing
	      echo -n " (already running with pid: $PID)"
	      RETVAL=0
	      return $RETVAL
	    fi
	  fi
	  #avgd is dead, clean mess (old pid and pipe files), before run
     echo -n " (recovering)"
	  rm -f $AVG_RUN_DIR/*
	fi

	# make sure it doesn't core dump anywhere unless requested
	ulimit -S -c ${DAEMON_COREFILE_LIMIT:-0} >/dev/null 2>&1
	
	# if they set NICELEVEL, honor it
	[ -n "$NICELEVEL" ] && nice="nice -n $NICELEVEL"

	# And start it up.
	if [ "$SUSER" = "root" ] ; then	    
	  $nice "$AVG_CTL" --start >/dev/null 2>&1
	else
	  $nice su -s /bin/sh -c "$AVG_CTL --start >/dev/null 2>&1" $SUSER
	fi	
	RETVAL=$?	
   return $RETVAL
}



############################################################
# Functions for echoing


dist_echo_status_begin()
{
    stat_busy "Checking for service ${AVG_DAEMON}: "
}


dist_echo_status_end()
{
    stat_done
}


dist_echo_start_begin()
{
    stat_busy "Starting $AVG_DAEMON"
}


dist_echo_start_end()
{
    [ "$RETVAL" -eq 0 ] && stat_done || stat_fail
}


dist_echo_stop_begin()
{
    stat_busy "Shutting down $AVG_DAEMON"    
}


dist_echo_stop_end()
{
    [ "$RETVAL" -eq 0 ] && stat_done || stat_fail
}


dist_echo_reload_begin()
{
    stat_busy "Reloading virus database: "
}


dist_echo_reload_end()
{
    [ "$RETVAL" -eq 0 ] && stat_done || stat_fail
}

# From avgd.all

if [ $(id -u) -ne 0 ] ; then
    echo "ERROR: Try to run this as root."
    # LSB specification errorcode
    exit 4
fi

# split deprecated variables in avgdinit.conf into new ones,
# used (and possibely reset in sourced functions.*) since v7.5
if [ -n "$AVG_LOCK_FILE" ] ; then
    AVG_LOCK_FILE_NAME=${AVG_LOCK_FILE##*/}
    AVG_LOCK_FILE_DIR=${AVG_LOCK_FILE%/*}
fi
if [ -n "$AVG_CONF_FILE" ] ; then
    AVG_CONF_FILE_NAME=${AVG_CONF_FILE##*/}
    AVG_CONF_FILE_DIR=${AVG_CONF_FILE%/*}
fi

# Source our distro-specific init functions and variables
# which can override common/default init functions.
# They can also source some init functions (mainly these
# used for echoing) provided by distro.

if [ -f ${AVG_SCRIPTS_DIR}/functions.${distro} ] ; then
    . ${AVG_SCRIPTS_DIR}/functions.${distro}
fi

# After sourcing distro-specific variables
# we can set some composite path variables

if [ -n "$AVG_LOCK_FILE_NAME" ] ; then
    AVG_LOCK_FILE="${AVG_LOCK_FILE_DIR}/${AVG_LOCK_FILE_NAME}"
fi

if [ -n "$AVG_CONF_FILE_NAME" ] ; then
    AVG_CONF_FILE="${AVG_CONF_FILE_DIR}/${AVG_CONF_FILE_NAME}"
fi


# Source configuration

if [ -f "/etc/sysconfig/${AVG_DAEMON}" ] ; then
	. "/etc/sysconfig/${AVG_DAEMON}"
fi


# Check that required config file exists.

if [ -n "$AVG_CONF_FILE" -a ! -f "$AVG_CONF_FILE" ] ; then
    echo "ERROR: Could not find ${AVG_CONF_FILE}"
    # LSB specification errorcode
    if [ "$1" = "status" ] ; then 
	exit 150
    else 
	exit 6 
    fi
fi

status() 
{
    dist_echo_status_begin
    dist_status
    dist_echo_status_end
    return $RETVAL
}


start() 
{
    dist_echo_start_begin
    dist_start
    dist_echo_start_end
    if [ -n "$AVG_LOCK_FILE" ] ; then
	[ "$RETVAL" -eq 0 ] && touch "${AVG_LOCK_FILE}" || RETVAL=150
    fi
    return $RETVAL
}
  

stop() 
{
    dist_echo_stop_begin
    dist_stop
    dist_echo_stop_end
    if [ -n "$AVG_LOCK_FILE" ] ; then
	[ "$RETVAL" -eq 0 ] && rm -f "${AVG_LOCK_FILE}" || RETVAL=150
    fi
    return $RETVAL
}


reload() 
{
    dist_echo_reload_begin
    dist_reload
    dist_echo_reload_end
    return $RETVAL
}


restart() 
{
    stop
    start
}


case "$1" in
    start)
	start
	;;
    stop)
	stop
	;;
    status)
	status
	;;
    restart)
	restart
	;;
    reload)
	reload
	;;
    condrestart)
    	# Restarts the servce iff it is already running
	# (which is detected by presence of lockfile or status function).
	if [ -n "$AVG_LOCK_FILE" ] ; then 
	    [ -f "${AVG_LOCK_FILE}" ] && restart || :
	else 
	    dist_status > /dev/null && restart || :
	fi
	;;
    *)
	echo "Usage: $0 {start|stop|status|reload|restart|condrestart}"
	exit 1
esac

exit $?
