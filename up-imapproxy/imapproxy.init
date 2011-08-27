#!/bin/sh
## 
##               Copyright (c) 2002,2003 Dave McMurtrie
##
## This file is part of imapproxy.
##
## imapproxy is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
##
## imapproxy is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with imapproxy; if not, write to the Free Software
## Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
##
##
##  Facility:
##
##	imapproxy.init
##
##  Abstract:
##
##	in.imapproxyd startup script
##
##  Authors:
##
##      Dave McMurtrie <davemcmurtrie@hotmail.com>
##
##  RCS:
##
##      $Source: /afs/pitt.edu/usr12/dgm/work/IMAP_Proxy/scripts/RCS/imapproxy,v $
##      $Id: imapproxy,v 1.2 2002/12/19 21:48:07 dgm Exp $
##      
##  Modification History:
##
##      $Log: imapproxy,v $
##      Revision 1.2  2002/12/19 21:48:07  dgm
##      Removed the notion of the startup script reading the config file and
##      passing arguments to the server process on startup.
##
##      Revision 1.1  2002/07/03 14:02:55  dgm
##      Initial revision
##
##
# Init file for imapproxy server daemon
#
# chkconfig: 2345 99 10
# description:  Imapproxy Daemon 
#
# processname: in.imapproxyd
# config: /etc/imapproxy.conf

Pgm=`/usr/bin/basename $0`
PROXY_BIN=/sbin/in.imapproxyd

. /etc/rc.conf
. /etc/rc.d/functions

case $1 in

    'start')

	# make sure the executable exists.

	if [ ! -f $PROXY_BIN ]; then
	    /bin/echo "$Pgm: $PROXY_BIN does not exist.  Not starting IMAP proxy server." 1>&2
	    stat_fail
	    exit 1
	fi

	/bin/echo "$Pgm: Starting IMAP proxy server." 1>&2

	$PROXY_BIN &
	stat_done
	;;



    'stop')

	/bin/echo "$Pgm: Shutting down IMAP proxy server." 1>&2
        stat_done
	pkill -x in.imapproxyd

	;;


    *)
	/bin/echo "usage: $Pgm {start|stop}" 1>&2

	exit 0

	;;

esac
