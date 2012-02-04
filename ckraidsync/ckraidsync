#!/bin/bash

#
# Script to start a scheduled RAID array synchronisation check
#
# Mark Smith, <markzzzsmith@yahoo.com.au>
#
# Version 0.1.0
#
# This is GPL'd :-)
#
# Intended to be installed in /etc/cron.daily.  The script uses the at(1) 
# command to schedule the actual raid sync check, as cron may execute the
# daily scripts at time when the raid check would be better avoided e.g.
# 12.00am. The default scheduled time to start the RAID array check is 4.00am.
#

#
# Start time for the raid synchronisation check.
# Passed to atd(8) to start the job. Must be in at(1) format.
#
START_TIME=04:00

# 
# Call at(1), using a "here-document" to get at(1) to run the raid sync check
# Send at(1) stdout and stderr to /dev/null, so we don't get email from at(1)
# when it executes
#
at $START_TIME > /dev/null 2>&1 <<EOT

#
# Type of synchronisation action to perform, either "check" or "repair".
# See <kernel-src>/Documentation/md.txt under "sync_action" for the 
# differences.
#
SYNC_ACTION=check 

#
# Now start the synchronisation 
#
# Note, the for loop will run through very quickly, and will not wait
# for the synchronisation check to complete. The kernel itself
# will not perform parallel sychronisation checks on raid devices
# who's underlying component devices are the same, so the sync check will
# be serialised, which is what we want.
#
for raid_dev in /sys/block/md*; do

	sync_action_file=\$raid_dev/md/sync_action

	if [ -e \$sync_action_file ]; then

		current_sync_state=\`cat \$sync_action_file\`;

		if [ \$current_sync_state == 'idle' ]; then

			echo \$SYNC_ACTION  > \$sync_action_file;

		fi

	fi

done

EOT

