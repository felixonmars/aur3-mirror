#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
#. /opt/etc/conf.d/sshd
SSHD_ARGS=""
PIDFILE=/var/run/obsshd.pid
PID=$(cat $PIDFILE 2>/dev/null)
if ! readlink -q /proc/$PID/exe | grep -q '^/opt/ob-openssh/sbin/sshd'; then
	PID=
	rm $PIDFILE 2>/dev/null
fi

case "$1" in
	start)
		stat_busy 'Starting Secure Shell Daemon'
		if [ ! -s "/opt/ob-openssh/etc/ssh_host_rsa_key" ]
		then
			/opt/ob-openssh/bin/ssh-keygen -t rsa -f /opt/ob-openssh/etc/ssh_host_rsa_key -N ""
		fi
		if [ ! -s "/opt/ob-openssh/etc/ssh_host_dsa_key" ]
		then
			/opt/ob-openssh/bin/ssh-keygen -t dsa -f /opt/ob-openssh/etc/ssh_host_dsa_key -N ""
		fi		
		
		[[ -d /var/empty ]] || mkdir -p /var/empty
		[[ -z $PID ]] && /opt/ob-openssh/sbin/sshd $SSHD_ARGS
		if [[ $? -gt 0 ]]; then
			stat_fail
		else
			add_daemon sshd
			stat_done
		fi
		;;
	stop)
		stat_busy 'Stopping Secure Shell Daemon'
		[[ ! -z $PID ]] && kill $PID &> /dev/null
		if [[ $? -gt 0 ]]; then
			stat_fail
		else
			rm_daemon sshd
			stat_done
		fi
		;;
	restart)
		$0 stop
		sleep 1
		$0 start
		;;
	*)
		echo "usage: $0 {start|stop|restart}"
esac
exit 0
