#!/bin/sh

sleep 60

while :
do
	status=`cable-status 2>&1 |awk '{print $4;}'`
	if [ "$status" == down ]; then
		cable-start > /dev/null 2>&1
	else
		sleep 60
	fi
done
