#!/bin/bash

# Copyright (c) 2012, Mark van Dijk
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.


. /etc/rc.conf
. /etc/rc.d/functions

rcwait() {
		local success

		for (( i=29; i >= 0; i-- )); do
				[[ ! -d /proc/${1} ]] && success=1 && break
				(( i % 3 )) || stat_append .
				sleep 1s
		done 

		(( success )) && return || return 1
}


case "$1" in
		start)
				stat_busy "Mounting Network Filesystems"
				mount -a -t $NETFS; rc1=$?
				mount -a -O _netdev; rc2=$?
				(( rc || rc2 )) && stat_die
				add_daemon netmount; stat_done
				;;
		stop)
				stat_busy "Unmounting Network Filesystems"
				( umount -a -O _netdev && umount -a -t "$NETFS" ) & pid=$!

				if rcwait $pid; then
						rm_daemon netmount
						stat_done
				else
						stat_append ' timed out.'
						rm_daemon netmount
						stat_die
				fi
				;;
		restart)
				$0 stop
				sleep 1
				$0 start
				;;
		*)
				echo "usage: $0 {start|stop|restart}"
				exit 1
esac

# vim: ts=4 sw=4 et ft=sh
