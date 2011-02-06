#!/bin/bash
#===============================================================================
#
#          FILE:  eventdump.sh
# 
#         USAGE:  ./eventdump.sh 
# 
#   DESCRIPTION:  Uses mysqldump to create a .sql file for individual zm
#                events to make Event table recovery possible by doing a
#                'find' search in ZoneMinder the events directory
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  --- mysqldump
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:   Ross Melin <rdmelin@gmail.com> 
#       COMPANY:  
#       VERSION:  1.0
#       CREATED:  03/06/2008 11:51:19 AM PST
#      REVISION:  ---
#===============================================================================

# Edit these to suit your configuration
ZM_CONFIG=/etc/zm.conf
MYSQLDUMP=/usr/bin/mysqldump
EVENTSDIR=/var/lib/zm/www/events

# The rest should not need editing

# Get the mysql user and password
source $ZM_CONFIG
MYDUMPOPTS="--user=$ZM_DB_USER --password=$ZM_DB_PASS --skip-opt --compact --quick --no-create-info"


for tag in $(find $EVENTSDIR -amin -65 -name ".[0-9]*")
	do
		EVENT_PATH=$(echo $tag |cut -f 1 -d .)
		EVENT_ID=$(echo $tag |cut -f 2 -d .)
		# Dump the sql statements needed to reload the Events, Frames and Stats tables

		echo "-- ZM_DB_VERSION=$ZM_VERSION
" > $EVENT_PATH.sql

		$MYSQLDUMP $MYDUMPOPTS --where="Id=$EVENT_ID" zm Events >> $EVENT_PATH.sql
		$MYSQLDUMP $MYDUMPOPTS --where="Eventid=$EVENT_ID" zm Frames >> $EVENT_PATH.sql
		$MYSQLDUMP $MYDUMPOPTS --where="Eventid=$EVENT_ID" zm Stats >> $EVENT_PATH.sql

done
