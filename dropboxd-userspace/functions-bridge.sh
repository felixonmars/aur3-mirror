#!/bin/bash
# dropboxd seems to have problems, wehn /etc/rc.d/functions has been loaded in a script that starts it.
# for this reason, this script creates a 'bridge' to use the needed functions anyway.

. /etc/rc.conf
. /etc/rc.d/functions

. /etc/conf.d/dropboxd-userspace.conf

case $1 in
  stat_busy)
	stat_busy "$2"
	;;
  stat_done)
	stat_done "$2"
	;;
  stat_fail)
	stat_fail "$2"
        ;;
  add_daemon)
	add_daemon "$2"
        ;;
  rm_daemon)
	rm_daemon "$2"
        ;;
  *)
	echo ""
        ;;
esac
