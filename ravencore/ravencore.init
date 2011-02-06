#!/bin/bash
#
#                  RavenCore Hosting Control Panel
#                Copyright (C) 2005  Corey Henderson
#
#     This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#
#
# ravencore        Startup script for the RavenCore Hosting Control Panel
#
# description: A Free Hosting Control Panel
# processname: ravencore.httpd
# config: /usr/local/ravencore/etc/ravencore.httpd.conf
# pidfile: /usr/local/ravencore/var/run/ravencore.httpd.pid
#
# Adapted for ArchLinux -  SharkOS.org :: Chris Tusa <linisys@gmail.com>

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/ravencore.conf || exit 1


    echo -n $"Starting control panel: "

    $RC_ROOT/sbin/run_cmd rcserver


PID=`pidof -o %PPID /usr/local/ravencore/sbin/ravencore.httpd`
PID2=`cat $RC_ROOT/var/run/rcserver.pid`
case "$1" in
  start)
    stat_busy "Starting Ravencore control panel"
    [ -z "$PID" ] && $RC_ROOT/sbin/run_cmd rcserver
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon ravencore
	  if [ ! -f $RC_ROOT/var/run/install_complete ]; then
            echo
            echo "----------"
            echo
            echo "Thank You for using RavenCore!"
            echo
            echo "The install/upgrade process will not be completed until after you login to the control panel web interface as the admin user, and accept the license agreement (GPL)."
            echo
       # simple loop to get all IP addresses bound to a machine
            IP_ADDRESSES=$(for IFACE in `ifconfig | grep -v '^ ' | awk '{print $1}'`; do echo $(for i in `ifconfig | awk "/^\$IFACE/ {print \\$1}"`; do ifconfig $i | grep -o 'addr:[[:digit:]]\{1,3\}\.[[:digit:]]\{1,3\}\.[[:digit:]]\{1,3$
            for i in $IP_ADDRESSES; do echo "http://"$i":8000/"; done
            echo
            passwd=$(cat $RC_ROOT/.shadow 2> /dev/null)
            if [ "$passwd" = "ravencore" ]; then
                echo "NOTE: You have not yet set your admin password!"
                echo "You can do this by running this as root: "$RC_ROOT"/sbin/run_cmd passwd"
            fi
          fi
      stat_done
    fi
    ;;

  stop)
    stat_busy "Stopping Ravencore control panel"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon glusterfs
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