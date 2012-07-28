#!/bin/bash

# Assumptions:
# You want to start daemons upon network connect.
# You might connect to multiple networks or vpn's simultaniously.
# You don't want to shut down daemons until netowrks are disconnected

c=start
# credit goes to flexiondotorg for the following line. From his ufw dispatcher script.
if [ ! `nm-tool|grep State|head -n1|cut -d':' -f2|sed s'/ //g'` == "connected(global)" ]; then
	c=stop
fi

# Source rc.conf, to get the NET_DAEMONS array
. /etc/rc.conf

# loop through NET_DAEMONS Array. Perform appropriate activity.
for i in ${NET_DAEMONS[@]}
do
	if [ -e "/etc/rc.d/$i" ]; then
		rc.d $c $i
	fi
done

