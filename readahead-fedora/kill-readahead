#!/bin/bash

EXITCOUNT=1000
COUNT=0

while [[ $EXITCOUNT -ge $COUNT ]] ; do
	if [ -f /tmp/.kill_readahead-collector ]; then	
		if [ "$(pidof readahead-collector)" ] 
		then
		  killall readahead-collector
		fi

		rm -fr /tmp/.kill_readahead-collector
		exit 0
	fi

	sleep 0.4
	let COUNT+=1
done
