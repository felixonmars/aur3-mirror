#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

GITDIR="/usr/share/webapps/gitorious"
RAKE="/opt/ruby-enterprise/bin/rake"

case "$1" in
	start)
		stat_busy "Starting gitorious ultrasphinx"
		/bin/su - git -c "cd $GITDIR && $RAKE ultrasphinx:daemon:start RAILS_ENV=production"
		if [ $? -gt 0 ]; then
			stat_fail
		else
			add_daemon gitorious-ultrasphinx
			stat_done
		fi
		;;
	stop)
		stat_busy "Stopping gitorious ultrasphinx"
		/bin/su - git -c "cd $GITDIR && $RAKE ultrasphinx:daemon:stop RAILS_ENV=production"
		if [ $? -gt 0 ]; then
			stat_fail
		else
			rm_daemon git-daemon
			stat_done
		fi
		;;
	status)
		/bin/su - git -c "cd $GITDIR && $RAKE ultrasphinx:daemon:start RAILS_ENV=production"
		;;
	restart)
		stat_busy "Restarting gitorious ultrasphinx"
		/bin/su - git -c "cd $GITDIR && $RAKE ultrasphinx:daemon:restart RAILS_ENV=production"
		if [ $? -gt 0 ]; then
			stat_fail
			rm_daemon gitorious-ultrasphinx
		else
			add_daemon gitorious-ultrasphinx
			stat_done
		fi
		;;
	*)
		echo "usage: $0 {start|stop|status|restart}"
esac
exit 0
