#!/bin/bash

# tunlr 0.2.0 - watch netflix, mtu, cbs, hulu & more outside the u.s.
# for more information about tunlr please visit <http://tunlr.net/>
#
# Copyright: (C) 2012-2014 edloaa <edloaa at googlemail dot com>
# License: GPL-3 <http://www.gnu.org/licenses/gpl-3.0.txt>

# VARIABLES

VERS="0.2.0"
RSLV=/etc/resolv.conf
NLL=/dev/null
IPV4='\<[[:digit:]]{1,3}(\.[[:digit:]]{1,3}){3}\>'

# TUNLR GATEKEEPER API --> http://forum.tunlr.net/index.php/topic,169.0.html

check_activation="https://gatekeeper-api.tunlr.net/api_v1/check_activation"
update_ip="https://gatekeeper-api.tunlr.net/api_v1/update_ip/$2"
get_account="https://gatekeeper-api.tunlr.net/api_v1/get_account/$2"
get_dns="https://gatekeeper-api.tunlr.net/api_v1/get_dns"


if [ $UID != 0 ] && [[ "$1" =~ start|stop ]]
then
	echo "you must be root to run 'tunlr $1'" 1>&2
	exit 1
fi

usage() {
	echo -e "tunlr $VERS\n"
	echo "usage: tunlr {start|stop|check|update [TOKEN]|get [TOKEN]}"
	echo
	echo "OPTIONS:"
	echo " start   - enables tunlr DNS in $RSLV"
	echo " stop    - disables tunlr DNS in $RSLV"
	echo " check   - checks activation status"
	echo " update  - updates the IP address in Gatekeeper, requires TOKEN"
	echo -e " get     - returns information about Gatekeeper account, requires TOKEN\n"	
	exit 0
}


err() { echo "failed"; exit 1; }

wget_err() {
		if [ $? -ne "0" ]
		then
			echo "an error occured - please try again"
			exit 1
		fi
}

case "$1" in

	start)	echo -n "activating tunlr service... "

		# DNS IP QUERY
		L1=$(wget -q -O - "$get_dns" | grep -Eo "$IPV4")

		if [ -z "$L1" ]
		then
			echo -e "failed\nDNS address query failed - no IP address received"
			exit 1
		else
			L2=$(echo "$L1" | sed 's/ /\n/g' | sed 's/^/nameserver /g')
			L3=$(echo $L1 | sed -e 's/ / and /g')
		fi

		if [ -f $RSLV.bak ]
		then
			echo -e "failed\n$RSLV.bak does already exist - nothing will be changed"
			exit 1
		else
			cp $RSLV $RSLV.bak 2>$NLL || err
		fi

		echo -e "#TUNLR DNS\n$L2" >$RSLV 2>$NLL
		cat $RSLV.bak >>$RSLV
		echo -e "ok\n$L3 have been added to $RSLV\nrestart your web browser to apply the changes"
		;;

	stop)	echo -n "deactivating tunlr service... "

		if [ -f $RSLV.bak ]
		then
			cp $RSLV.bak $RSLV 2>$NLL || err
			rm $RSLV.bak 2>$NLL || err
			echo -e "ok\nrestart your web browser to apply the changes"
		else
			echo -e "failed\n$RSLV.bak does not exist - unable to restore DNS config"
			exit 1
		fi
		;;

	check)	echo -e "activation status...\n"

		wget -q -O - "$check_activation"		# returns "active", although it isn't (!?)
		wget_err
		echo -e "\n"
		;;

	update)	echo -e "updating the IP address...\n"

		if [ -z "$2" ]
		then
			echo "error - please insert your TOKEN"
			exit 1
		else
			wget -q -O - "$update_ip"
			wget_err
			echo
		fi
		;;

	get)	echo -e "information about your gatekeeper account...\n"

		if [ -z "$2" ]
		then
			echo "error - please insert your TOKEN"
			exit 1
		else
			wget -q -O - "$get_account"
			wget_err
			echo
		fi
		;;

	*)	usage ;;

esac

exit 0
