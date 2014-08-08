#!/bin/bash
# rc.d script that launch service defined in systemd service unit
# Symlink this to same name as systemd unit has(without .service extension)
# and run as usual
# (Example: ln -s systemd-unit NetworkManager)

# Version 0.2
# Changelog:
#  0.2 - added support for service@user symlink format
#  0.1 - initial
#
#
# TODO: 
#	- Environment
#	- ExecStartPre, ExecStartPost (AFAIK not used by any real service)

. /etc/rc.conf
. /etc/rc.d/functions

function read_ini { # Parameters: filename, key, default value
	# Reads value (key) from ini file
	x=$(cat $1 | egrep "^[ ]*""$2""[ ]*"= | cut -d = -f 2-)
	[ x"$x" == x ] && x="$3"
	echo "$x"
}

function smallest_pidof { # Parameters: username program
	# Gets smallest PID of specified program running under specified user
	for pid in $(pidof -x $2 | tr " " "\n" | sort | head -1) ; do
		[ x"$(stat -c %U /proc/$pid)" == x"$1" ] && echo $pid
	done
}

function start { # Parameters: username program parameters...
	# Starts program directly, if username is root, or using su for other users
	USER=$1
	shift
	if [ x"$USER" == x"root" ] ; then
		$@
	else
		su $USER -c "$@"
	fi
	return $?
}

function nice_kill { # Parameters: PID
	# Sends SIGTERM, waits 5 secs (if necessary) and then kills
	kill $PID
	sleep 0.1
	kill -0 $PID 2>/dev/null || return 0
	for i in 1 2 3 4 5 ; do
	sleep 1
	kill -0 $PID 2>/dev/null || return 0
	done
	kill -9 $PID 
	echo "Killed." >/dev/stderr
}

# Detect service name and systemd unit file
SERVICE=$(basename $0)
NAME=$SERVICE
USER=root
FILE=/usr/lib/systemd/system/$SERVICE.service

# Check for @username
if [[ "$SERVICE" == *@* ]] ; then
	USER=${SERVICE#*@}
	SERVICE=${SERVICE%%@*}
	FILE=/usr/lib/systemd/system/$SERVICE@.service
	NAME=${SERVICE}@${USER}
fi

# Read configuration
DESC=$(read_ini $FILE Description $SERVICE)
ENVIRON=$(read_ini $FILE EnvironmentFile)
ENVIRON=${ENVIRON#"-"}
TYPE=$(read_ini $FILE Type simple)

# Check for "%i" in description
[[ "$DESC" == *%i* ]] && DESC="${DESC%%\%i*}${USER}${DESC#*\%i}"

[ x"$ENVIRON" != x ] && [ -e "$ENVIRON" ] && source "$ENVIRON"

case "$1" in
  start)
	EXEC=$(read_ini $FILE ExecStart /bin/false)
	EXEC=$(eval echo $EXEC)
	if [ x"$TYPE" == xforking ] ; then
		# Forking service
		stat_busy "Starting $DESC"
		if start $USER $EXEC ; then
			add_daemon $NAME
			stat_done
		else
			stat_fail
			exit 1
		fi
	elif [ x"$TYPE" == xoneshot ] ; then
		# Oneshot
		stat_busy "Executing $DESC"
		if start $USER $EXEC ; then
			stat_done
		else
			stat_fail
			exit 1
		fi
	else
		# Everything else (dbus, notify, idle, simple)
		stat_busy "Starting $DESC"
		if [[ "$EXEC" == -* ]] ; then
			# There is no need to check if daemon is really running
			EXEC=${EXEC#"-"}
			start $USER $EXEC &>/dev/null &
			stat_done
		else
			# Daemon is launched on background and it's excepted to stay alive 
			start $USER $EXEC &>/dev/null &
			sleep 0.1
			if [ x$(smallest_pidof $USER $EXEC) != x ] ; then
				stat_done
			else
				stat_fail
				exit 1
			fi
		fi
	fi
  ;;
  stop)
	if [ x"$TYPE" == xoneshot ] ; then
		# stop command is not available for oneshots; displays help message
		$0
		exit 1
	fi
	PIDFILE=$(read_ini $FILE PIDFile)
	EXECSTOP=$(read_ini $FILE ExecStop)
	PID=""
	stat_busy "Stopping $DESC"
	if [ x"$PIDFILE" != x ] ; then
		# Read PID from defined PID file
		PID=$(cat $PIDFILE 2>/dev/null)
		if [ x"$PID" == x ] ; then
			echo "Failed to read PID file $PIDFILE" >/dev/stderr
			stat_fail
			exit 1
		fi
	fi
	if [ x"$EXECSTOP" != x ] ; then
		# Stop using defined command
		MAINPID=$PID
		EXECSTOP=$(eval echo $EXECSTOP)
		if [[ "$EXECSTOP" == -* ]] ; then
			# There is no need to check if command was sucessfull
			EXECSTOP=${EXECSTOP#"-"}
			start $USER $EXECSTOP
			stat_done
		else
			if $EXECSTOP ; then
				stat_done
			else
				stat_fail
				exit 1
			fi
		fi
	elif [ x"$PID" != x ] ; then
		# Stop using PID from PID file
		nice_kill $PID
		rm_daemon $NAME
		stat_done
	else
		# Stop using PID of program defined in ExecStart
		EXEC=$(read_ini $FILE ExecStart /bin/false)
		PID=$(smallest_pidof $USER $EXEC)
		if [ x"$PID" == x ] ; then
			echo "Service is already stopped" >/dev/stderr
			stat_fail
			exit 1
		fi
		nice_kill $PID
		rm_daemon $NAME
		stat_done
	fi
  ;;
  restart)
    if [ x"$TYPE" == xoneshot ] ; then
		# Oneshot cannot be restarted. Display help
		$0
		exit 1
	else
		RESTARTSEC=$(read_ini $FILE RestartSec 0.1)
		$0 stop
		sleep $RESTARTSEC
		$0 start
	fi
  ;;
  reload)
	EXEC=$(read_ini $FILE ExecReload)
	if [ x"$EXEC" != x -a x"$TYPE" != xoneshot ] ; then
		stat_busy "Reloading $DESC"
		PIDFILE=$(read_ini $FILE PIDFile /dev/null)
		MAINPID=$(cat $PIDFILE 2>/dev/null)
		[ x"$MAINPID" == x ] && MAINPID=$(smallest_pidof $USER $(read_ini $FILE ExecStart /bin/false) )
		EXEC=$(eval echo $EXEC)
		if start $USER $EXEC ; then
			stat_done
			exit 0
		else
			stat_fail
			exit 1
		fi
	else
		$0	# reload command is not available; displays help message
		exit 1
	fi
  ;;
  *)
	RELOADEXEC=$(read_ini $FILE ExecReload)
	USAGE="start"
	[ x"$TYPE" != xoneshot ] && USAGE="$USAGE|stop|restart"
	[ x"$RELOADEXEC" != x ]  && USAGE="$USAGE|reload"
	echo "usage: $0 {$USAGE}" >&2
	exit 1
  ;;
esac
