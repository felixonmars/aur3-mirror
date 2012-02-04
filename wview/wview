#!/bin/bash

# add to the shared library search path
export LD_LIBRARY_PATH=/usr/lib:/usr/local/lib:/usr/lib
CONF_DIRECTORY=/etc/wview
RUN_DIRECTORY=/var/wview
WVIEW_INSTALL_DIR=/usr/bin
### BEGIN INIT INFO
# Provides:          wview
# Required-Start:    $local_fs $network $time $syslog
# Required-Stop:     $local_fs $network $time $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start wview daemons at boot time
# Description:       Start wview daemons at boot time.
### END INIT INFO
# config:            $prefix/etc/wview
# pidfiles:          $prefix/var/wview/*.pid
################################################################################

WVIEWD_FILE=`cat $CONF_DIRECTORY/wview-binary`
WVIEWD_BIN=$WVIEW_INSTALL_DIR/$WVIEWD_FILE
test -x $WVIEWD_BIN || exit 5

HTMLD_BIN=$WVIEW_INSTALL_DIR/htmlgend
test -x $HTMLD_BIN || exit 6

FTPD_BIN=$WVIEW_INSTALL_DIR/wviewftpd
test -x $FTPD_BIN || exit 7

SSHD_BIN=$WVIEW_INSTALL_DIR/wviewsshd
test -x $SSHD_BIN || exit 7

ALARMD_BIN=$WVIEW_INSTALL_DIR/wvalarmd
test -x $ALARMD_BIN || exit 8

CWOPD_BIN=$WVIEW_INSTALL_DIR/wvcwopd
test -x $CWOPD_BIN || exit 9

HTTP_BIN=$WVIEW_INSTALL_DIR/wvhttpd

RADROUTER_BIN=$WVIEW_INSTALL_DIR/radmrouted

PMOND_BIN=$WVIEW_INSTALL_DIR/wvpmond
test -x $PMOND_BIN || exit 10

RADROUTER_PID=$RUN_DIRECTORY/radmrouted.pid
WVIEWD_PID=$RUN_DIRECTORY/wviewd.pid
HTMLD_PID=$RUN_DIRECTORY/htmlgend.pid
FTPD_PID=$RUN_DIRECTORY/wviewftpd.pid
SSHD_PID=$RUN_DIRECTORY/wviewsshd.pid
ALARMD_PID=$RUN_DIRECTORY/wvalarmd.pid
CWOPD_PID=$RUN_DIRECTORY/wvcwopd.pid
HTTP_PID=$RUN_DIRECTORY/wvhttpd.pid
PMOND_PID=$RUN_DIRECTORY/wvpmond.pid

case "$1" in
  start)
	echo "Starting wview daemons:"
	if [ -f $RADROUTER_PID ]; then
		echo "radlib router pid file $RADROUTER_PID exists - killing existing process"
		kill -15 `cat $RADROUTER_PID`
		rm -f $RADROUTER_PID
	fi
	if [ -f $WVIEWD_PID ]; then
		echo "wviewd pid file $WVIEWD_PID exists - killing existing process"
		kill -15 `cat $WVIEWD_PID`
		rm -f $WVIEWD_PID
	fi
	if [ -f $HTMLD_PID ]; then
		echo "htmlgend pid file $HTMLD_PID exists - killing existing process"
		kill -15 `cat $HTMLD_PID`
		rm -f $HTMLD_PID
	fi
	if [ -f $FTPD_PID ]; then
		echo "wviewftpd pid file $FTPD_PID exists - killing existing process"
		kill -15 `cat $FTPD_PID`
		rm -f $FTPD_PID
	fi
	if [ -f $SSHD_PID ]; then
		echo "wviewsshd pid file $SSHD_PID exists - killing existing process"
		kill -15 `cat $SSHD_PID`
		rm -f $SSHD_PID
	fi
	if [ -f $ALARMD_PID ]; then
		echo "wvalarmd pid file $ALARMD_PID exists - killing existing process"
		kill -15 `cat $ALARMD_PID`
		rm -f $ALARMD_PID
	fi
	if [ -f $CWOPD_PID ]; then
		echo "wvcwopd pid file $CWOPD_PID exists - killing existing process"
		kill -15 `cat $CWOPD_PID`
		rm -f $CWOPD_PID
	fi
	if [ -f $HTTP_PID ]; then
		echo "wvhttpd pid file $HTTP_PID exists - killing existing process"
		kill -15 `cat $HTTP_PID`
		rm -f $HTTP_PID
	fi
	if [ -f $PMOND_PID ]; then
		echo "wvpmond pid file $PMOND_PID exists - killing existing process"
		kill -15 `cat $PMOND_PID`
		rm -f $PMOND_PID
	fi

	if [ -x $RADROUTER_BIN ]; then
	    $RADROUTER_BIN 1 $RUN_DIRECTORY
	else
	    echo "Cannot find $RADROUTER_BIN - exiting!"
	    exit 10
	fi
	sleep 1
	$WVIEWD_BIN
	sleep 1
	$HTMLD_BIN
	$ALARMD_BIN
	$CWOPD_BIN
	if [ -x $HTTP_BIN ]; then
	    $HTTP_BIN
	fi
	$FTPD_BIN
	$SSHD_BIN
    $PMOND_BIN
    ;;
  stop)
	echo "Shutting down wview daemons..."
	if [ -f $PMOND_PID ]; then
	    kill -15 `cat $PMOND_PID`
	fi
	if [ -f $HTTP_PID ]; then
	    kill -15 `cat $HTTP_PID`
	fi
	if [ -f $CWOPD_PID ]; then
	    kill -15 `cat $CWOPD_PID`
	fi
	if [ -f $ALARMD_PID ]; then
	    kill -15 `cat $ALARMD_PID`
	fi
	if [ -f $SSHD_PID ]; then
	    kill -15 `cat $SSHD_PID`
	fi
	if [ -f $FTPD_PID ]; then
	    kill -15 `cat $FTPD_PID`
	fi
	if [ -f $HTMLD_PID ]; then
	    kill -15 `cat $HTMLD_PID`
	fi
	if [ -f $WVIEWD_PID ]; then
	    kill -15 `cat $WVIEWD_PID`
	fi
	sleep 1
	if [ -f $RADROUTER_PID ]; then
	    kill -15 `cat $RADROUTER_PID`
	fi
    ;;
  restart)
	$0 stop  && sleep 2
	$0 start
    ;;
  force-reload)
	$0 stop  && sleep 2
	$0 start
    ;;
  status)
	ps aux | grep "wv"
	ps aux | grep "htmlgend"
    ;;
  *)
	echo "Usage: $0 {start|stop|restart|force-reload|status}"
	exit 1
esac

exit 0

