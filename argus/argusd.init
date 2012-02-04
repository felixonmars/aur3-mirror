#!/bin/sh

# Copyright (c) 2002 by Jeff Weisberg
# Author: Jeff Weisberg <argus @ tcp4me.com>
# Date: 2002-Jun-21 18:43 (EDT)
# Function: argusd startup rc script

# $Id: rc.argusd,v 1.5 2002/11/19 23:42:07 jaw Exp $


case "$1" in
    start)
	# ulimit does not have a standard/portable syntax
	# if you need more file descriptors, put the command here
	# eg: ulimit -n 1000

	# since rc files normally run as root, and
	# you may not want argus running as root,
	# to run argus as a certain user or group
	# add  -u user and/or -g group  below
	
	/opt/argus/sbin/argusd
	;;
	
    stop)
	/opt/argus/sbin/argusctl shutdown reason="rc.argusd stop"
	;;
    restart)
	/opt/argus/sbin/argusctl shutdown reason="rc.argusd stop"
	/opt/argus/sbin/argusd
	;;
    *)
	echo usage: $0 'start|stop'
	exit 1
	;;
esac
exit 0

