#!/bin/bash
### Script to poke a remote/backup MX server using ETRN
#	Copyright (c) 2009 Phillip Smith
# 091006 - Original Script Written
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
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#

# Version Number
VER=0.1.1

# Path to options file
case $# in
1)
	BACKUP_MX="$1"
	OPTIONS_FILE='/etc/etrn-poke/options.conf'
	;;
2)
	BACKUP_MX="$1"
	OPTIONS_FILE="$2"
	;;
*)
	echo "Usage: $0 remote-mx-server [options file]"
	exit 1
	;;
esac

#=====================================================================
#=====================================================================
#=====================================================================
#
# YOU SHOULD NOT NEED TO MODIFY ANYTHING BELOW HERE!!
#
#=====================================================================
#=====================================================================
#=====================================================================
#
# Check config file exists
if [ -e "$OPTIONS_FILE" ] ; then
	source $OPTIONS_FILE
	if [ -z "$EP_OPT_VER" -o "$EP_OPT_VER" != $VER ] ; then
		echo "I DIED! Options file invalid or version mismatch"
		exit 1
	fi
else
	echo "I DIED! Failed to find the options file: $OPTIONS_FILE"
	exit 1
fi
#
# Make all config variables from optons.conf READ-ONLY
declare -r PSQL
declare -r SED
declare -r TR
declare -r FETCHMAIL

MISSING_BIN=''
[ -x "$PSQL" ]		|| MISSING_BIN="$MISSING_BIN psql not found: $PSQL\n"
[ -x "$SED" ]		|| MISSING_BIN="$MISSING_BIN sed not found: $SED\n"
[ -x "$TR" ]		|| MISSING_BIN="$MISSING_BIN tr not found: $GREP\n"
[ -x "$FETCHMAIL" ]	|| MISSING_BIN="$MISSING_BIN fetchmail not found: $FETCHMAIL\n"
if [ -n "$MISSING_BIN" ] ; then
	echo "Some required programs were not found. Please check $OPTIONS_FILE to ensure correct paths are set."
	echo "The missing files are:"
	echo -e $MISSING_BIN
fi

#
# Find a list of domains we are primary for
if [ "$USE_DB" = 'yes' ] ; then
	export PGPASSWORD="$PGSQL_PASSWORD"
	DOMAINS=`$PSQL --host=$PGSQL_HOST --username=$PGSQL_USERNAME --dbname=$PGSQL_DATABASE --no-password -P format=Unaligned -P fieldsep=, -tqc "SELECT \"$PGSQL_COL\" FROM \"$PGSQL_TABLE\" WHERE backupmx IS FALSE AND active IS TRUE ORDER BY 1;" | $SED -e 's/ALL//g'`
	if [ $? -ne 0 ] ; then
		echo "Failed to retrieve domain list from PostgreSQL server ($PGSQL_HOST) with username $PGSQL_USERNAME"
		exit 1
	else
		ETRN_LIST=`echo $DOMAINS | $TR ' ' ','`
	fi
fi

#
# Poke the remote MX server
FETCHMAIL_OPTS='-v'
if [ -n "$ETRN_LIST" ] ; then
	$FETCHMAIL -q -p ETRN --fetchdomains $ETRN_LIST $FETCHMAIL_OPTS $BACKUP_MX
	RETVAL=$?
else
	echo "No domains in the ETRN list; Aborting the poke!"
	RETVAL=1
fi
exit $RETVAL
