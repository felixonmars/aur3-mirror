#!/bin/sh

# Service Configuration Tool, Copyright (C) 2009 Edgar Merino <emerino at gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License. 
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  US
#
#
# This script wraps a service from /etc/rc.d, centralizing service administration
# in a very easy way. It provides a mechanism for enabling and disabling services 
# in /etc/rc.conf. It is specially useful when combined with a shell that provides
# completion for commands (like ZSH or recent BASH versions).


RC_CONF=/etc/rc.conf
RC_CONF_BAK=/etc/rc.conf.bak

# Get a list of currently enabled services in /etc/rc.conf
SERVICES=`cat $RC_CONF | grep "DAEMONS=("`

enable_service() {
	local old_services

	# Ignore if the service is already enabled in /etc/rc.conf
	if [[ `echo ${SERVICES} | grep $1` == "" ]]; then
		old_services=`echo ${SERVICES}`
		SERVICES=`echo ${SERVICES} | sed -e "s/)/ $1)/g"`	
		sed -e "s/${old_services}/${SERVICES}/g" $RC_CONF_BAK > $RC_CONF
	fi
}

disable_service() {
	local old_services

	# Remove the service from the DAEMONS array in /etc/rc.conf
	if [[ `echo ${SERVICES} | grep $1` != "" ]]; then
		old_services=`echo ${SERVICES}`
		SERVICES=`echo ${SERVICES} | sed -e "s/$1 //;t;s/ $1)/)/"`
		sed -e "s/$old_services/$SERVICES/g" $RC_CONF_BAK > $RC_CONF
	fi
}


#####################################################
# MAIN
#####################################################


SERVICES_DIR=/etc/rc.d

# Create a backup in case something goes wrong
cp $RC_CONF $RC_CONF_BAK

case $2 in 
	(enable)
		${SERVICES_DIR}/$1 start &&	enable_service $1
		;;
	(disable)
		${SERVICES_DIR}/$1 stop && disable_service $1
		;;
	(*)
		${SERVICES_DIR}/$1 $2
esac

