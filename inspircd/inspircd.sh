#!/bin/bash
. /etc/rc.conf
. /etc/rc.d/functions
#####################

basepath="/usr/lib/inspircd/"
confpath="/etc/inspircd"
binpath="/usr/sbin/"
executable="inspircd"
log="/var/log/inspircd/"


pid=`pidof inspircd`
function cmd_start() {
	stat_busy "Starting InspIRCd"
	config="$confpath/inspircd.conf"

	if [ ! -e $config ]
	then
		printhl "Read \"/etc/inspircd/inspircd.conf.example\""
	fi

	if [ ! "`grep ^irc /etc/group`" ]
	then
		printhl "adding new group: irc"
		/usr/sbin/groupadd -g 71 irc
	fi
	if [ ! "`grep ^irc /etc/passwd`" ]
	then
		printhl "adding new user: irc"
		/usr/sbin/groupadd -g irc -u 71 -d /var/empty -s /bin/bash -c 'IRC Daemon' irc
	fi

	if [ ! -e $log ]
	then
		mkdir -p $log
	fi


	touch $log/startup.log
	chown irc.irc /var/log/inspircd/startup.log

	touch /var/run/inspircd.pid
	chown irc.irc /var/run/inspircd.pid
	[ -z "$pid" ] && su --command="$binpath$executable  --config=$config --logfile=$log/startup.log" - irc #use the other line if you want quiet output
	#[ -z "$pid" ] && su --command="$binpath$executable  --config=$config --logfile=$log/startup.log >/dev/null" - irc
	if [ $? -gt 0 ] 
	then
		stat_fail
	else
		add_daemon inspircd
		stat_done
	fi
}

function cmd_stop() {
	stat_busy "Stopping InspIRCd"
	[ ! -z "$pid" ] && kill $pid &>/dev/null
	if [ $? -gt 0 ]
	then
		stat_fail
	else
		rm_daemon inspircd
		stat_done
	fi
}

function usage() {
	echo "$0 (start|restart|stop)"
}

case $1 in 
	start)
		cmd_start
		;;
	stop)
		cmd_stop
		;;
	restart)
		cmd_stop
		pid=""
		cmd_start
		;;
	*)
		usage
		;;
esac

