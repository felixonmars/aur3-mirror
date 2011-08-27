#! /bin/bash
### BEGIN INIT INFO
# Provides:          MRIMT
# Required-Start:    $syslog
# Required-Stop:     $syslog
# Should-Start:      $local_fs
# Should-Stop:       $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: starts MRIMt transport for Jabber
# Description:       starts MRIMt which provides a gateway that allows Jabber users to communicate with their
#                    contacts on the ICQ Messenger network. It can connect to any Jabber server
#                    that supports the Connect component mechanism.  
### END INIT INFO
set -e

export PATH=/sbin:/bin:/usr/sbin:/usr/bin

NAME=mrimt
DESC="Mail.ru Agent transport for Jabber"

PIDDIR=/var/run/mrimt
PIDFILE=$PIDDIR/$NAME.pid
USER=mrimt
GROUP=mrimt

SSD_OPTS="--pidfile=$PIDFILE --name=python --user=$USER"

DAEMON=/usr/bin/python
OPTIONS="/usr/lib/mrimt/src/mrim.py -d -c /etc/ejabberd/mrimt.conf -p $PIDFILE"

test -f $DAEMON || exit 0

if test ! -e $PIDDIR; then
	mkdir $PIDDIR
	chown $USER:$GROUP $PIDDIR
fi

case "$1" in
start)
	echo -n "Starting $DESC: "
#	(start-stop-daemon --start $SSD_OPTS --startas "$DAEMON" --chuid "$USER" -- $OPTIONS)
#	if test "$?" = 0; then echo "$NAME."; fi
	su $USER -c "$DAEMON $OPTIONS"
	;;
stop)
	echo -n "Stopping $DESC: "
#	(start-stop-daemon --stop $SSD_OPTS --retry 10)
#	if test "$?" = 0; then echo "$NAME."; fi
        kill `cat $PIDFILE`
	;;
reload|force-reload)
	echo -n "Reloading $DESC configuration..."
	(start-stop-daemon --stop $SSD_OPTS --signal HUP)
	if test "$?" = 0; then echo 'done.'; fi
	;;
restart)
	$0 stop
	$0 start
	;;
*)
	echo "Usage: /etc/init.d/$NAME {start|stop|restart|reload|force-reload}" >&2
	exit 1
	;;
esac

exit 0

# vim: filetype=sh
