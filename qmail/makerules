#!/bin/sh
cd /etc/tcpcontrol
for ruledir in */
do
	ruledir=`basename $ruledir /`
	echo "Making rules from folder '$ruledir'"
	cdb=${ruledir}.cdb
	tmp=${ruledir}.tmp
	ipsvd-cdb $cdb $tmp $ruledir
done

