#!/bin/bash
### Backup specified File System to file
# Original script:	MySQL Backup Script
#			VER. 2.5 - http://sourceforge.net/projects/automysqlbackup/
#			Copyright (c) 2002-2003 wipe_out@lycos.co.uk
# 090106 - Hacked by PHS to do PostgreSQL Databases instead of MySQL
# 090113 - Hacked by PHS to do file system backups instead of PostgreSQL
# 090630 - Changed the tar command to use the 'p' argument to ensure permissions
#	   are backed up.
# 090807 - Minor non-dangerous bug fixes.
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
VER=0.5.2

# Path to options file
if [ $# -eq 1 ] ; then
	OPTIONS_FILE="$1"
elif [ $# -eq 0 ] ; then
	OPTIONS_FILE='/etc/filesystem-backup/options.conf'
else
	echo "Usage: $0 [options file]"
	exit 30
fi

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
	if [ -z "$FSBU_OPT_VER" -o "$FSBU_OPT_VER" != $VER ] ; then
		echo "Options file invalid or version mismatch"
		exit 1
	fi
else
	echo "Failed to find the options file: $OPTIONS_FILE"
	exit 1
fi
#
# Make all config variables from optons.conf READ-ONLY
declare -r USERNAME
declare -r GROUP
declare -r BACKUPDIR
declare -r INCLUDE_LIST
declare -r EXCLUDE_LIST
declare -r MAILCONTENT
declare -r MAILADDR
declare -r DOWEEKLY
declare -r LATEST
declare -r PREBACKUP
declare -r POSTBACKUP
declare -r DATE
declare -r HOSTNAME
declare -r TAR
declare -r MKDIR
declare -r LN
declare -r RM
declare -r CHOWN
declare -r CHMOD
declare -r FIND
declare -r TOUCH

# Runtime Vars
DATESTAMP=`$DATE +%Y-%m-%d_%Hh%Mm`			# Datestamp e.g 2002-09-21
DOW=`$DATE +%A`						# Day of the week e.g. Monday
DNOW=`$DATE +%u`					# Day number of the week 1 to 7 where 1 represents Monday
DOM=`$DATE +%d`						# Date of the Month e.g. 27
M=`$DATE +%B`						# Month e.g January
W=`$DATE +%V`						# Week Number e.g 37
HOST=`$HOSTNAME -s`					# Hostname of this machine
BACKUPFILES=""
ERRSTAT=0

# Check for $BACKUP_NAME
if [ -n "$BACKUP_NAME" ] ; then
	# options file specifies a backup name; use it in the log filenames
	BACKUP_NAME=${BACKUP_NAME/ /_}		# Replace spaces with underscores cause spaces are a PITA.
	LOGFILE=$BACKUPDIR/$BACKUP_NAME-`$DATE +%N`.log
	LOGERR=$BACKUPDIR/ERRORS_$BACKUP_NAME-`$DATE +%N`.log
	TAR_LABEL="${BACKUP_NAME}_${DATESTAMP}_${DOW}"			# Label for the Tar Archive
	BNAME=$BACKUP_NAME
else
	LOGFILE=$BACKUPDIR/$HOST-`$DATE +%N`.log
	LOGERR=$BACKUPDIR/ERRORS_$HOST-`$DATE +%N`.log
	TAR_LABEL="${HOST}_${DATESTAMP}_${DOW}"			# Label for the Tar Archive
	BNAME=$HOST
fi	

# The --atime-preserve option needs to be removed from the $OPT variable
# on RedHat systems. Their version fo 'tar' is too old I guess.
OPT="--label='$TAR_LABEL' --atime-preserve=system --no-wildcards-match-slash"	# OPT string for use with tar

# Create required directories
if [ ! -e "$BACKUPDIR" ] ; then		# Check Backup Directory exists.
	mkdir -p "$BACKUPDIR"
fi

if [ ! -e "$BACKUPDIR/daily" ] ; then	# Check Daily Directory exists.
	mkdir -p "$BACKUPDIR/daily"
fi

if [ ! -e "$BACKUPDIR/weekly" ]	; then	# Check Weekly Directory exists.
	mkdir -p "$BACKUPDIR/weekly"
fi

if [ ! -e "$BACKUPDIR/monthly" ] ; then	# Check Monthly Directory exists.
	mkdir -p "$BACKUPDIR/monthly"
fi

if [ "$LATEST" = "yes" ] ; then
	if [ ! -e "$BACKUPDIR/latest" ]	; then # Check Latest Directory exists.
		mkdir -p "$BACKUPDIR/latest"
	fi
	eval $RM -f "$BACKUPDIR/latest/${BNAME}*"
fi

# IO redirection for logging.
$TOUCH $LOGFILE
exec 6>&1           # Link file descriptor #6 with stdout.
                    # Saves stdout.
exec > $LOGFILE     # stdout replaced with file $LOGFILE.
$TOUCH $LOGERR
exec 7>&2           # Link file descriptor #7 with stderr.
                    # Saves stderr.
exec 2> $LOGERR     # stderr replaced with file $LOGERR.

# Output Extension (depends on the output format)
if [ "$COMP" = 'gzip' ] ; then
	COMP='z'
	OUTEXT='tgz'
elif [ "$COMP" = 'bzip2' ] ; then
	COMP='j'
	OUTEXT='tar.bz2'
else
	echo "Invalid output format configured. Defaulting to 'gzip'"
	COMP='z'
	OUTEXT='tgz'
fi

# Make sure our include / exclude files are valid
if [ -e "$INCLUDE_LIST" ] ; then
	for SRCFILE in $(cat $INCLUDE_LIST) ; do
		if [ ! -e "$SRCFILE" ] ; then
			echo "ERROR: $SRCFILE is in $INCLUDE_FILE but doesn't exist."
			ERRSTAT=1
		fi
	done
else
	# Include List doesn't exist
	echo "ERROR: Invalid include file specified"
	ERRSTAT=1
fi
if [ ! -e "$EXCLUDE_LIST" ] ; then
	# Exclude List doesn't exist
	echo "ERROR: Invalid exclude file specified"
	ERRSTAT=1
fi
if [ $ERRSTAT -ne 0 ] ; then
	echo "Error in backup include/exclude files. Can not continue"
	exit 2
fi	

#########################
# Functions

# Database dump function
DoBackup () {
	#$TAR czf ${TAR_FNAME} --label "${TAR_LABEL}" --files-from=${BACKUP_LIST} --exclude-from=${BACKUP_EXCL} 2> ${ERRLOG}
	$TAR c${COMP}pf $1 $OPT --files-from "$INCLUDE_LIST" --exclude-from="$EXCLUDE_LIST" 
	RETVAL=$?
	if [ $RETVAL -ne 0 ] ; then
		ERRSTAT=1
	fi
	return $RETVAL
}
LinkLatest () {
	if [ "$LATEST" = "yes" ]; then
		$LN "$1" "$BACKUPDIR/latest/${BNAME}.${OUTEXT}"
	fi
}

#########################################

# Run command before we begin
if [ "$PREBACKUP" ] ; then
	echo ======================================================================
	echo "Prebackup command output."
	echo
	eval $PREBACKUP
	echo
	echo ======================================================================
	echo
fi

echo ======================================================================
echo AutoFileSystemBackup VER $VER
echo   Variant of: http://sourceforge.net/projects/automysqlbackup/
echo 
echo "Backup of '$BNAME'"
echo ======================================================================

echo Backup Start Time `$DATE`
echo ======================================================================
if [ $DOM = "01" ]; then
	# Monthly Backup
	if [ ! -d "$BACKUPDIR/monthly/$BNAME" ] ; then		# Check Monthly Host Directory exists.
		mkdir -p "$BACKUPDIR/monthly/$BNAME"
	fi
	echo Monthly Backup...
	ONAME="$BACKUPDIR/monthly/${BNAME}/${BNAME}_${DATESTAMP}_${M}.${OUTEXT}"
	DoBackup "$ONAME"
	LinkLatest "$ONAME"
	BACKUPFILES="$BACKUPFILES $ONAME"
	echo ----------------------------------------------------------------------
elif [ $DNOW = $DOWEEKLY ]; then
	# Weekly Backup
	echo Weekly Backup
	
	if [ ! -d "$BACKUPDIR/weekly/$BNAME" ] ; then		# Check Weekly Host Directory exists.
		$MKDIR -p "$BACKUPDIR/weekly/$BNAME"
	fi
	echo Rotating 5 weeks Backups...
	if [ "$W" -le 03 ];then
		REMW=`expr 51 + $W`
	elif [ "$W" -lt 12 ];then
		REMW=0`expr $W - 3`
	else
		REMW=`expr $W - 3`
	fi
	eval $RM -f "$BACKUPDIR/weekly/${BNAME}/${BNAME}_week${REMW}_*.${OUTEXT}" 
	echo
	ONAME="$BACKUPDIR/weekly/${BNAME}/${BNAME}_week${W}_${DATESTAMP}.${OUTEXT}"
	DoBackup "$ONAME"
	LinkLatest "$ONAME"
	BACKUPFILES="$BACKUPFILES $ONAME"
	echo ----------------------------------------------------------------------
else
	# Daily Backup
	echo Daily Backup
	if [ ! -d "$BACKUPDIR/daily/$BNAME" ] ; then		# Check Daily Host Directory exists
		$MKDIR -p "$BACKUPDIR/daily/$BNAME"
	fi
	echo Rotating last weeks Backup...
	eval $RM -f "$BACKUPDIR/daily/${BNAME}/${BNAME}_*_${DOW}.${OUTEXT}"
	echo
	ONAME="$BACKUPDIR/daily/${BNAME}/${BNAME}_${DATESTAMP}_${DOW}.${OUTEXT}"
	DoBackup "$ONAME"
	LinkLatest "$ONAME"
	BACKUPFILES="$BACKUPFILES $ONAME"
	echo ----------------------------------------------------------------------
fi

echo Backup End `$DATE`
echo ======================================================================
if [ $UID -eq 0 ] ; then
	echo "Setting correct ownership..."
	echo Owner:	$USERNAME
	echo Group:	$GROUP
	$FIND $BACKUPDIR -name \*${BNAME}\* -exec $CHOWN ${USERNAME}:${GROUP} {} \;
else
	echo "CAN NOT SET OWNERSHIPS BECAUSE NOT RUNNING AT ROOT"
fi
echo "Setting correct permissions..."
$FIND $BACKUPDIR -type d -name \*${BNAME}\* -exec $CHMOD 750 {} \;
$FIND $BACKUPDIR -type f -name \*${BNAME}\* -exec $CHMOD 640 {} \;
echo

echo Total disk space used for backup storage..
echo Size - Location
echo `du -hs "$BACKUPDIR"`
echo
echo ======================================================================

# Run command when we're done
if [ "$POSTBACKUP" ]
	then
	echo ======================================================================
	echo "Postbackup command output."
	echo
	eval $POSTBACKUP
	echo
	echo ======================================================================
fi

#Clean up IO redirection
exec 1>&6 6>&-      # Restore stdout and close file descriptor #6.
exec 1>&7 7>&-      # Restore stdout and close file descriptor #7.

if [ "$MAILCONTENT" = "log" ] ; then
	cat "$LOGFILE" | mail -s "File System Backup Log for $BNAME - $DATESTAMP" $MAILADDR
	if [ $ERRSTAT -ne 0 ] ; then
		cat "$LOGERR" | mail -s "ERRORS REPORTED: File System Backup error Log for $BNAME - $DATESTAMP" $MAILADDR
	fi	
elif [ "$MAILCONTENT" = "quiet" ] ; then
	if [ $ERRSTAT -ne 0 ] ; then
		cat "$LOGERR" | mail -s "ERRORS REPORTED: File System Backup error Log for $BNAME - $DATESTAMP" $MAILADDR
		cat "$LOGFILE" | mail -s "File System Backup Log for $BNAME - $DATESTAMP" $MAILADDR
	fi
else
	if [ $ERRSTAT -ne 0 ] ; then
		cat "$LOGFILE"
		echo
		echo "!!!!!! WARNING !!!!!!"
		echo "Errors reported during AutoFileSystemBackup execution.. Backup failed"
		echo "Error log below.."
		cat "$LOGERR"
	else
		cat "$LOGFILE"
	fi	
fi

# Clean up Logfile
eval $RM -f "$LOGFILE"
eval $RM -f "$LOGERR"

exit $ERRSTAT
