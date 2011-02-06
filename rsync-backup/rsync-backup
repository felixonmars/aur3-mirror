#!/bin/bash
### Backup specified File System to file via rsync
# Original script:	MySQL Backup Script
#			VER. 2.5 - http://sourceforge.net/projects/automysqlbackup/
#			Copyright (c) 2002-2003 wipe_out@lycos.co.uk
# 090106 - Hacked by PHS to do PostgreSQL Databases instead of MySQL
# 090113 - Hacked by PHS to do file system backups instead of PostgreSQL
# 090630 - Changed the tar command to use the 'p' argument to ensure permissions
#	   are backed up.
# 090806 - Hacked by PHS to do rsync backups instead of using tar
# 091215 - Major bug fix as pointed out by pichulines. The script would *always*
#          do monthly.0 backups when backing up to a local mount!
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
VER=0.6.0

# Path to options file
if [ $# -eq 1 ] ; then
        OPTIONS_FILE="$1"
elif [ $# -eq 0 ] ; then
	OPTIONS_FILE='/etc/rsync-backup/options.conf'
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
        if [ -z "$RSBU_OPT_VER" -o "$RSBU_OPT_VER" != $VER ] ; then
                echo "Options file invalid or version mismatch"
                exit 1
        fi
else
        echo "Failed to find the options file: $OPTIONS_FILE"
        exit 1
fi

#
# Make all config variables from optons.conf READ-ONLY
declare -r BACKUP_HOST
declare -r BACKUP_USER
declare -r LOGDIR
declare -r INCLUDE_LIST
declare -r EXCLUDE_LIST
declare -r MAILCONTENT
declare -r MAILADDR
declare -r PREBACKUP
declare -r POSTBACKUP
declare -r INCREMENTAL
declare -r DATE
declare -r HOSTNAME
declare -r RSYNC
declare -r TOUCH
declare -r SSH

#
# Runtime Vars
DATESTAMP=`$DATE +%Y-%m-%d_%Hh%Mm`			# Datestamp e.g 2002-09-21
LOGSTAMP="`$DATE +%Y%m%d-%H%M%S_`$$"			# Unique timestamp to make unique logfile (timestamp + PID of this process)
MONTHSTAMP=`$DATE +%Y%m%d-%H%M%S`			# Unique timestamp to make unique monthly snapshot (timestamp)
DOW=`$DATE +%u`						# Day of the week, 1 to 7, 1 is Monday
DOM=`$DATE +%d`						# Date of the Month e.g. 27
HOST=`$HOSTNAME -s`					# Hostname of this machine
LOGFILE="${LOGDIR}/${HOST}-rsync-${LOGSTAMP}.log"	# Logfile Name
LOGERR="${LOGDIR}/${HOST}-rsync-${LOGSTAMP}.err"	# Logfile Name
ERRSTAT=0

# Make sure our logging directory exists
if [ ! -d "$LOGDIR" ] ; then 
	echo "Logging directory $LOGDIR does not exist; creating it now."
	mkdir -p "$LOGDIR"
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

# Make sure our include / exclude files are valid
if [ ! -e "$INCLUDE_LIST" ] ; then
	echo "ERROR: Invalid include file specified"
	ERRSTAT=13
fi
if [ ! -e "$EXCLUDE_LIST" ] ; then
	echo "ERROR: Invalid exclude file specified"
	ERRSTAT=14
fi

#
# Check if we need to use SSH as the transport
if [ $USE_SSH -eq 1 ] ; then
	# Check that the BACKUP_USER variable has been set
	# in the options.conf file
	if [ -z "$BACKUP_HOST" ] ; then
		echo "ERROR: Backup host not specified. Can not continue."
		ERRSTAT=2
	fi
	if [ -z "$BACKUP_USER" ] ; then
		echo "WARNING: Backup user not specified. Defaulting to $USER"
		BACKUP_USER="$USER"
	fi
fi

# Set defaults that haven't been configured in options.conf
if [ -z "$BACKUP_DIR" ] ; then
	BACKUP_DIR=$HOST
fi

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
echo AutoRsyncBackup VER $VER
echo   Variant of: http://sourceforge.net/projects/automysqlbackup/
echo 
echo Backup of Host - $HOST
echo ======================================================================

echo Backup Start Time `$DATE`
echo
if [ $USE_SSH -eq 0 ] ; then
	echo "Doing a backup to local mount point"
else
	echo "Doing a backup over SSH transport"
	echo "Backup Dir is:  $BACKUP_DIR"
	echo "Backup Host is: $BACKUP_HOST"
	echo "Backup User is: $BACKUP_USER"
fi
echo
echo ======================================================================

if [ $ERRSTAT -eq 0 ] ; then
	# Daily Backup
	echo
	echo "Starting rsync backup..."
	echo

	if [ $USE_SSH -eq 0 ] ; then
		# Do a backup to a local mount
		if [ $INCREMENTAL -ne 0 ] ; then
			echo "Doing an incremental backup; Rolling previous backups"
			# Step 1
			# Remove oldest backup
			rm -Rf $BACKUP_DIR/daily.6
			
			# Step 2
			# Move all backups back one step
			mv --no-target-directory $BACKUP_DIR/daily.5 $BACKUP_DIR/daily.6
			mv --no-target-directory $BACKUP_DIR/daily.4 $BACKUP_DIR/daily.5
			mv --no-target-directory $BACKUP_DIR/daily.3 $BACKUP_DIR/daily.4
			mv --no-target-directory $BACKUP_DIR/daily.2 $BACKUP_DIR/daily.3
			mv --no-target-directory $BACKUP_DIR/daily.1 $BACKUP_DIR/daily.2
			
			# Step 3
			# Hard-link last backup to daily.1 directory
			cp -al $BACKUP_DIR/daily.0 $BACKUP_DIR/daily.1
		fi

		# Step 4
		# Do the rsync backup of current backup
		#   D = preserve devices and special files
	        $RSYNC 	--links \
			--times \
			--verbose \
			--recursive \
			--perms \
			--group \
			-D \
			--compress \
			--delete \
			--delete-excluded \
			--exclude-from="${EXCLUDE_LIST}" \
			--include-from="${INCLUDE_LIST}" \
			/ \
			${BACKUP_DIR}/daily.0
		RETVAL=$?
		if [ $RETVAL -ne 0 ] ; then
			ERRSTAT=1
		fi

		# Step 5
		# Touch the backup directory to show the last backup time
		touch ${BACKUP_DIR}/daily.0

		# Step 6
		# Create Monthly / Weekly snapshots if required
		if [ $INCREMENTAL -ne 0 ] ; then
			if [ $DOM -eq 1 ] ; then
				# Make a monthly snapshot
				cp -al ${BACKUP_DIR}/daily.0 ${BACKUP_DIR}/monthly.$MONTHSTAMP
			elif [ $DOW -eq 7 ] ; then
				# Make weekly snapshot (on Sunday)
				rm -Rf ${BACKUP_DIR}/weekly.3
				mv --no-target-directory ${BACKUP_DIR}/weekly.2 ${BACKUP_DIR}/weekly.3
				mv --no-target-directory ${BACKUP_DIR}/weekly.1 ${BACKUP_DIR}/weekly.2
				mv --no-target-directory ${BACKUP_DIR}/weekly.0 ${BACKUP_DIR}/weekly.1
				cp -al ${BACKUP_DIR}/daily.0 ${BACKUP_DIR}/weekly.0
			fi
		fi
	else
		# Do a backup over SSH
		echo "Backing up to $BACKUP_HOST using SSH"
		echo
		echo "Destination is ${BACKUP_USER}@${BACKUP_HOST}:${BACKUP_DIR}/daily.0"
		echo

		if [ $INCREMENTAL -ne 0 ] ; then
			echo "Doing an incremental backup; Rolling previous backups"
			# Step 1
			# Remove oldest backup
			$SSH -l $BACKUP_USER $BACKUP_HOST "chmod -R 777 $BACKUP_DIR/daily.6"
			$SSH -l $BACKUP_USER $BACKUP_HOST "rm -Rf $BACKUP_DIR/daily.6"
			
			# Step 2
			# Move all backups back one step
			$SSH -l $BACKUP_USER $BACKUP_HOST "mv $BACKUP_DIR/daily.5 $BACKUP_DIR/daily.6"
			$SSH -l $BACKUP_USER $BACKUP_HOST "mv $BACKUP_DIR/daily.4 $BACKUP_DIR/daily.5"
			$SSH -l $BACKUP_USER $BACKUP_HOST "mv $BACKUP_DIR/daily.3 $BACKUP_DIR/daily.4"
			$SSH -l $BACKUP_USER $BACKUP_HOST "mv $BACKUP_DIR/daily.2 $BACKUP_DIR/daily.3"
			$SSH -l $BACKUP_USER $BACKUP_HOST "mv $BACKUP_DIR/daily.1 $BACKUP_DIR/daily.2"
			
			# Step 3
			# Hard-link last backup to daily.1 directory
			$SSH -l $BACKUP_USER $BACKUP_HOST "cp -al $BACKUP_DIR/daily.0 $BACKUP_DIR/daily.1"
		else
			echo "Not doing an incremental style backup"
		fi

		# Step 4
		# Do the rsync backup of current backup
	        #   D = preserve devices and special files
	        $RSYNC	--links \
			--times \
			--verbose \
			--recursive \
			--perms \
			--group \
			-D \
			--compress \
			--delete \
			--rsh ssh \
			--delete-excluded \
			--exclude-from="${EXCLUDE_LIST}" \
			--include-from="${INCLUDE_LIST}" \
			/ \
			${BACKUP_USER}@${BACKUP_HOST}:${BACKUP_DIR}/daily.0
		RETVAL=$?
		if [ $RETVAL -ne 0 ] ; then
			ERRSTAT=1
		fi

		# Step 5
		# Touch the backup directory to show the last backup time
		$SSH -l $BACKUP_USER $BACKUP_HOST "touch ${BACKUP_DIR}/daily.0"
		
		# Step 6
		# Create Monthly / Weekly snapshots if required
		if [ $INCREMENTAL -ne 0 ] ; then
			if [ $DOM -eq 1 ] ; then
				# Make a monthly snapshot
				echo "Creating a MONTHLY snapshot - monthly.$MONTHSTAMP"
				$SSH -l $BACKUP_USER $BACKUP_HOST "cp -al ${BACKUP_DIR}/daily.0 ${BACKUP_DIR}/monthly.$MONTHSTAMP"
			elif [ $DOW -eq 7 ] ; then
				# Make weekly snapshot (on Sunday)
				echo "Creating a WEEKLY snapshot"
				$SSH -l $BACKUP_USER $BACKUP_HOST "chmod -R 700 ${BACKUP_DIR}/weekly.3"
				$SSH -l $BACKUP_USER $BACKUP_HOST "rm -Rf ${BACKUP_DIR}/weekly.3"
				$SSH -l $BACKUP_USER $BACKUP_HOST "mv directory ${BACKUP_DIR}/weekly.2 ${BACKUP_DIR}/weekly.3"
				$SSH -l $BACKUP_USER $BACKUP_HOST "mv ${BACKUP_DIR}/weekly.1 ${BACKUP_DIR}/weekly.2"
				$SSH -l $BACKUP_USER $BACKUP_HOST "mv ${BACKUP_DIR}/weekly.0 ${BACKUP_DIR}/weekly.1"
				$SSH -l $BACKUP_USER $BACKUP_HOST "cp -al ${BACKUP_DIR}/daily.0 ${BACKUP_DIR}/weekly.0"
			fi
		fi
	fi
	echo
else
	echo
	echo "Not performing backup since some pre-backup checks failed."
	echo "Check the output above for more information"
	echo
fi

echo ----------------------------------------------------------------------

echo Backup End `$DATE`
echo ======================================================================
echo

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

# Clean up IO redirection
exec 1>&6 6>&-      # Restore stdout and close file descriptor #6.
exec 1>&7 7>&-      # Restore stdout and close file descriptor #7.

if [ "$MAILCONTENT" = "log" ] ; then
	cat "$LOGFILE" | mail -s "Rsync Backup Log for $HOST - $DATESTAMP" $MAILADDR
	if [ $ERRSTAT -ne 0 ] ; then
		cat "$LOGERR" | mail -s "ERRORS REPORTED: Rsync Backup error Log for $HOST - $DATESTAMP" $MAILADDR
	fi	
elif [ "$MAILCONTENT" = "quiet" ] ; then
	if [ $ERRSTAT -ne 0 ] ; then
		cat "$LOGERR" | mail -s "ERRORS REPORTED: Rsync Backup error Log for $HOST - $DATESTAMP" $MAILADDR
		cat "$LOGFILE" | mail -s "Rsync Backup Log for $HOST - $DATESTAMP" $MAILADDR
	fi
else
	if [ $ERRSTAT -ne 0 ] ; then
		cat "$LOGFILE"
		echo
		echo "!!!!!! WARNING !!!!!!"
		echo "Errors reported during AutoRsyncBackup execution. Backup failed"
		echo "Error log below.."
		cat "$LOGERR"
	else
		cat "$LOGFILE"
	fi	
fi

exit $ERRSTAT
