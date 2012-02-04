#!/bin/bash

# Source function library.
. /etc/rc.conf
. /etc/rc.d/functions

prog=ZoneMinder
ZM_VERSION="1.24.0"
ZM_PATH_BIN="/usr/lib/zm/bin"
ZM_CONFIG="/etc/zm.conf"
command="$ZM_PATH_BIN/zmpkg.pl"

loadconf()
{
	if [ -f $ZM_CONFIG ]; then
		. $ZM_CONFIG
	else
		echo "ERROR: $ZM_CONFIG not found.
" 
		return 1
	fi
}

# Check for old config and update if needed
checkcfg()
{
	# Check config
	if [ "$ZM_DB_HOST" = "" -o "$ZM_DB_NAME" = "" -o "$ZM_DB_USER" = "" -o "$ZM_DB_PASS" = "" ]; then
			echo "In $ZM_CONFIG there should not be null values.
"
			return 1
	loadconf
	fi
}

checkdb()
{
	# Check database exisits and version
	GetVer="select Value from Config where Name='ZM_DYN_DB_VERSION'"
	OLD_VERSION=`echo $GetVer | mysql -B -h $ZM_DB_HOST -u $ZM_DB_USER -p$ZM_DB_PASS $ZM_DB_NAME | grep -v '^Value'`
	if [ "$OLD_VERSION" = "" ]; then
		GetVer="select Value from Config where Name='ZM_DYN_CURR_VERSION'"
		OLD_VERSION=`echo $GetVer | mysql -B -h $ZM_DB_HOST -u $ZM_DB_USER -p$ZM_DB_PASS $ZM_DB_NAME | grep -v '^Value'`
		if [ "$OLD_VERSION" = "" ]; then
			echo "You must run $ZM_PATH_BIN/zminit manually
"
			return 1
		fi	
	fi
	RETVAL=$?
	
	if [ $RETVAL != 0 ]; then
		tbls=`mysql -h $ZM_DB_HOST -u $ZM_DB_USER -p$ZM_DB_PASS -s -e 'show tables' $ZM_DB_NAME`
		RETVAL=$?
		if [ $RETVAL = 0 ]; then
			echo "Initialize $prog database:
"
			echo tbls | grep Config >/dev/null 2>&1
			RETVAL=$?
			if [ $RETVAL != 0 ]; then
				mysql -B -h $ZM_DB_HOST -u $ZM_DB_USER -p$ZM_DB_PASS $ZM_DB_NAME < $ZM_PATH_UPDATE/zm_create.sql 
				RETVAL=$?
				[ $RETVAL = 0 ] && stat_done
				[ $RETVAL != 0 ] && stat_fail
				echo
				return $RETVAL
			fi
			( cd $ZM_PATH_UPDATE; perl $ZM_PATH_BIN/zmupdate.pl -f )
			RETVAL=$?
			[ $RETVAL = 0 ] && stat_done
			[ $RETVAL != 0 ] && stat_fail
			echo
			return $RETVAL
		else
			echo "No access to ZoneMinder database. 
Run $ZM_PATH_BIN/zminit manually.
"
			return $RETVAL
		fi
	else
		[ "$ZM_VERSION" = "$OLD_VERSION" ] && return 0
		echo "Upgrade %s database: " "$prog"
		$ZM_PATH_BIN/zmupdate.pl --version=$OLD_VERSION --noi && ( cd $ZM_PATH_UPDATE; perl $ZM_PATH_BIN/zmupdate.pl -f )
		RETVAL=$?
		[ $RETVAL = 0 ] && stat_done
		[ $RETVAL != 0 ] && stat_fail
		echo
		return $RETVAL
	fi
}

start()
{
	loadconf || return $?
	checkcfg || return $?
	checkdb || return $?
	stat_busy "Starting $prog"
	[ -d /var/run/zm ] || mkdir -m 774 /var/run/zm
	chown -R $ZM_WEB_USER:$ZM_WEB_GROUP /var/run/zm
	GetPath="select Value from Config where Name='ZM_PATH_SOCKS'"
	ZM_PATH_SOCK=`echo $GetPath | mysql -B -h $ZM_DB_HOST -u $ZM_DB_USER -p$ZM_DB_PASS $ZM_DB_NAME | grep -v '^Value'`
	[ -d $ZM_PATH_SOCK ] || mkdir -m 774 -p $ZM_PATH_SOCK 
	sudo -u  $ZM_WEB_USER test -O  $ZM_PATH_SOCK \
	|| chown -R $ZM_WEB_USER:$ZM_WEB_GROUP $ZM_PATH_SOCK
	# Setup the log dir
	[ -d /var/log/zm ] || mkdir /var/log/zm
	for logs in zmaudit.log  zmdc.log  zmfilter.log  zmpkg.log  zmupdate.log  zmwatch.log; do
	touch /var/log/zm/$logs
	done
	chown -R $ZM_WEB_USER:$ZM_WEB_GROUP  /var/log/zm
	$command start
	RETVAL=$?
	[ $RETVAL = 0 ] && stat_done
	[ $RETVAL != 0 ] && stat_fail
	#[ $RETVAL = 0 ] && touch /var/lock/subsys/zm
	return $RETVAL
}

stop()
{
	stat_busy "Stopping $prog"
	$command stop
	RETVAL=$?
	[ $RETVAL = 0 ] && stat_done
	[ $RETVAL != 0 ] && stat_fail
	#[ $RETVAL = 0 ] && rm -f /var/lock/subsys/zm
}

status()
{
	result=`$command status`
	if [ "$result" = "running" ]; then
		echo "ZoneMinder is running
"
		RETVAL=0
	else
		echo "ZoneMinder is stopped
"
		RETVAL=1
	fi
}

case "$1" in
	'start')
		start
		;;
	'stop')
		stop
		;;
	'restart')
		stop
		start
		;;
	'condrestart')
		loadconf
		checkcfg
		result=`$ZM_PATH_BIN/zmdc.pl check`
		if [ "$result" = "running" ]; then
			$ZM_PATH_BIN/zmdc.pl shutdown > /dev/null
			start
		fi
		;;
	'status')
		status
		;;
	*)
		echo "Usage: zm { start | stop | restart | condrestart | status }
"
		RETVAL=1
		;;
esac
exit $RETVAL
