#!/bin/bash
# Start pidgin safely, checking its xml settings files with md5 sums
#
PURPLEDIR=''
. /etc/conf.d/pidgin-safely.conf

# go to purple directory
if [[ $PURPLEDIR = '' ]]
then
	cd ~/.purple
else
	length=${#PURPLEDIR}
	# check for trailing file seperator
	if [ ${PURPLEDIR:$((length-1))}=="/" ]; then
		cd "$PURPLEDIR.purple"
	else
		cd "$PURPLEDIR/.purple"
	fi
fi

# check if there are md5sums
if [ -f checksums.md5 ]; then	
	md5sum -c checksums.md5 >checksums.stat
	echo "Comparing checksums with current xml files."
	# read checksum file and compare with current *.xml files
	while read LINE
	do
		FILE=${LINE%:*}
		STAT=${LINE#*:}
		if [[ $STAT = ' FAILED' ]]; then
			echo "$FILE seems broken and will be reverted."
			cp $FILE.bak $FILE
		fi
		let count++
	done < checksums.stat
	for f in $(find . -type f -name '*.xml'); do
		echo "Backing up ${f}"
		cp ${f} ${f}.bak
	done
else
	# this is hopefully only run the first time pidgin-safely is started
	md5sum *.xml >checksums.md5
	echo "Calculating first checksums."
fi
# start pidgin
echo "Starting pidgin"
pidgin
PRETURN=$?
echo "Pidgin exited."
# calculate checksums after pidgin exited
if [ $PRETURN -eq 0 ]; then
	# when pidgin exits correctly, calculate checksums
        md5sum *.xml >checksums.md5
        echo "Calculating checksums."
else
	#when pidgin fails on exit, do other stuff
	echo "Pidgin failed on exit with code: $PRETURN"
fi
