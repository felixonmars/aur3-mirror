#!/bin/sh

# Dave's NTP before init: alternative kernel init to set time before
# the real kernel init is launched
#
# Mainly targeted at computers without RTCs like Raspberry Pis
#
# Copyright (C) 2014 David Phillips
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or (at
# your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


######################################################################
## Default config
##
LOG_FILE="/dev/null"
TIMEOUT="60"
INTERFACE="eth0"
IP_VERSION="any"

# Import user-specified config
source /etc/ntp-before-init.conf

>"$LOG_FILE"

######################################################################
## Useful functions
## 
inform () {
	echo -e "\e[1;34m:::\e[1;37m $@\e[0m"
	echo ::: $@ >> "$LOG_FILE"
}

kill_from_pid_file () {
	test -r "$1" && kill $(cat "$1") 2>&1 | tee -a "$LOG_FILE"
}

######################################################################
## Let's do business
##


# Helpful message to show that we're actually running
inform ""
inform "Welcome to Dave's pre-init NTP helper (1.1)"

# Decide whether to use IPv4, v6 or any
case "$IP_VERSION" in
	4)
		inform Using IPv4 only
		IPFLAG="-4"
	;;

	6)
		inform Using IPv6 only
		IPFLAG="-6"
	;;
	
	*)
		inform Using any IP version
		IPFLAG=""
	;;
esac


# Bring up specified network interface
inform Bringing up interface "$INTERFACE" using dhcpcd
timeout "$TIMEOUT" dhcpcd --waitip $INTERFACE $IPFLAG 2>&1 | tee -a "$LOG_FILE"


# Attempt to set the time, displaying what it was before and after
inform "Time (before ntpd) is: $(date)"
inform "Setting time"
timeout "$TIMEOUT" ntpd -gq $IPFLAG 2>&1 | tee -a "$LOG_FILE"
inform "Time (after ntpd) is: $(date)"


# Kill what we started so everything can be managed by systemd.
# Killall requires /proc to be mounted, so we can't use it
inform "Killing all dhcpcd processes"
for p in /run/dhcpcd*.pid; do
	kill_from_pid_file "$p"
done

inform "Goodbye, I'm passing control to /sbin/init"
exec /sbin/init $@
######################################################################
