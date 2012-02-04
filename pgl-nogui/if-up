#!/bin/sh
# if-up - insert pglcmd iptables whitelisting rules for newly brought up
# interfaces.
# Copyright (C) 2008 - 2010 jre <jre-phoenix@users.sourceforge.net>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

# If used with NetworkManager, then only continue if an interface is brought up
# (not down). Ignored if this file is used otherwise (e.g. /etc/network/if-up.d
# in Debian).
if [ "$(dirname $0)" = /etc/NetworkManager/dispatcher.d ] ; then
	[ "$2" = up ] || [ "$2" = vpn-up ] || exit 0
fi

################################################################################
# The following code is common between pglcmd, pglcmd.wd,
# cron.daily, init and debian/postinst.

# if-up is similar, but exits successfully if CONTROL_MAIN is not there, yet.
# This can happen in early boot stages before local file systems are mounted.

# CONTROL_MAIN has to be set correctly in all just mentioned files.
CONTROL_MAIN="/usr/lib/pgl/pglcmd.main"

# Configure pglcmd and load functions.
if [ -f "$CONTROL_MAIN" ] ; then
    . $CONTROL_MAIN || { echo "$0 Error: Failed to source $CONTROL_MAIN although this file exists."; exit 1; }
else
    exit 0
fi

# End of the common code between pglcmd, pglcmd.wd,
# cron.daily, (if-up), init and debian/postinst.
################################################################################

test_root
# If the daemon is not running, just exit gracefully:
status_of_proc $DAEMON $NAME > /dev/null 2>&1 || exit 0
test_IPTABLES_VARS
# Exit if user doesn't want automatic whitelisting:
[ "$IPTABLES_SETTINGS" -eq 0 ] && exit 0
[ "$WHITE_LOCAL" -eq 0 ] && exit 0
test_DAEMON
test_CMD_PATHNAME
test_external iptables || exit $?

# Automatically whitelist LAN of all up interfaces, loopback interface
# and DNS server(s) (if configured)
date +%F" "%X" "%Z" Begin: $0 whitelisting LAN" >> $CMD_LOG 2>&1
white_local >> $CMD_LOG 2>&1
date +%F" "%X" "%Z" End: $0 whitelisting LAN" >> $CMD_LOG 2>&1

exit 0
