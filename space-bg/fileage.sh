#!/bin/bash
if [ ! -f $1 ] || [ ! -f $2 ]; then
	echo 9999
	exit
fi
ft=`ls -al --time-style='+%s' $1 | awk '{ print $6; }'`
lt=`ls -al --time-style='+%s' $2 | awk '{ print $6; }'`
dt=`expr $lt - $ft`
dt=`expr $dt / 3600`
#echo "$lt - $ft = $dt hours"
echo $dt
#
