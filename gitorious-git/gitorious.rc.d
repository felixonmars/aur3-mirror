#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

GITDIR="/usr/share/webapps/gitorious"
BUNDLE="/opt/ruby-enterprise/bin/bundle"

PIDF_GITD="$GITDIR/log/git-daemon.pid"
PIDF_POLLER="$GITDIR/tmp/pids/poller0.pid"

check_pid() {
	local PIDFILE="$1"
	[ ! -f "$PIDFILE" ] && return 1
	local PID=$(cat "$PIDFILE" 2> /dev/null)
	[ -z "$PID" ] && return 1
	if [ ! -d "/proc/$PID" ]; then
		rm -f "$PIDFILE" 2> /dev/null
		return 1
	fi
	return 0
}

kill_pid() {
	local PIDFILE="$1"
	if check_pid "$PIDFILE"; then
		local PID=$(cat "$PIDFILE" 2> /dev/null)
		kill $PID &> /dev/null
		local RET=$?
		check_pid "$PIDFILE"
		return $RET
	fi
	return 1
}

wait_pid() {
	while check_pid "$1"; do sleep 1; done
}

case "$1" in
	start)
		stat_busy "Starting git daemon"
		check_pid "$PIDF_GITD" || su - git -c "cd $GITDIR && $BUNDLE exec script/git-daemon -d"
		if [ $? -gt 0 ]; then
			stat_fail
		else
			add_daemon git-daemon
			stat_done
		fi

		stat_busy "Starting gitorious poller"
		if [ ! -d "$GITDIR/tmp/pids" ]; then
			mkdir "$GITDIR/tmp/pids"
			chown git:git "$GITDIR/tmp/pids"
		fi
		check_pid "$PIDF_POLLER" || su - git -c "cd $GITDIR && env RAILS_ENV=production $BUNDLE exec script/poller run" > /dev/null 2>&1 &
		if [ $? -gt 0 ]; then
			stat_fail
		else
			add_daemon gitorious-poller
			stat_done
		fi
		;;
	stop)
		stat_busy "Stopping git daemon"
		if ! kill_pid "$PIDF_GITD"; then
			stat_fail
		else
			rm_daemon git-daemon
			stat_done
		fi

		stat_busy "Stopping gitorious poller"
		if ! kill_pid "$PIDF_POLLER"; then
			stat_fail
		else
			rm_daemon gitorious-poller
			stat_done
		fi
		;;
	restart)
		$0 stop
		wait_pid "$PIDF_GITD"
		wait_pid "$PIDF_POLLER"
		$0 start
		;;
	*)
		echo "usage: $0 {start|stop|restart}"
esac
exit 0
