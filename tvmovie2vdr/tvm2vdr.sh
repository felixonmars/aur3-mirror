#!/bin/bash 
. /etc/rc.tvm2vdr

if [ -f /var/run/tvm2vdr.run ]; then
	echo already one tvm2vdr running
	echo if there is no tvm2vdr running, remove
	echo /var/run/tvm2vdr.run and retry.
	exit
fi
touch /var/run/tvm2vdr.run

if [ $SETSYSTIME == "Y" ]; then
	echo Synchronizing time at `date` >> /var/log/tvm2vdr.log
	/etc/rc.d/ntpdate start > /dev/null
	echo Time sychronized at `date` >> /var/log/tvm2vdr.log
fi

# start tvmovie2vdr
cd /usr/lib/vdr/tvmovie2vdr
/usr/lib/vdr/tvmovie2vdr/tvm2vdr >> /var/log/tvm2vdr.log 2>&1

# cleanup old images
find /video/epgimages/ -type f  -mtime +10 -exec rm {} \;

# shutting down, if requested
if [ $SYSPOWERDOWN == "Y" ]; then
        sleep 60
	echo stopping and shutting down at `date` >> /var/log/tvm2vdr.log
	/usr/bin/svdrpsend.pl hitk power
fi

rm /var/run/tvm2vdr.run
