#!/bin/bash

# Cannot vaccum if Firefox is using SQlite databse

proc="$(ps aux | grep firefox | grep -v grep | grep -v vaccum)"

if [ "$proc" != "" ]
then
	echo $proc
	echo "Firefox is still running, shut it down and try again"
	exit 1
fi


dirlist=$(cat /etc/passwd | cut -d':' -f6)

for dir in $dirlist
do

	if [ -e "$dir/.mozilla/firefox/profiles.ini" ]
	then

		for profiledir in $(cat $dir/.mozilla/firefox/profiles.ini | grep Path= | sed -e 's/Path=//')
		do

			for db in $(find $dir/.mozilla/firefox/$profiledir -type f -name '*.sqlite' -print)
			do
				echo "Processing $db ..."
				sqlite3 $db "VACUUM;"
			done

		done

	fi

done
