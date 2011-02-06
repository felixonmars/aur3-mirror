#!/bin/sh
#
# weekly update database for Non-DNS IP-to-country resolver
# Contributor: <fedoseev2004@yahoo.com>
#
QUIET="-q"
exec 2>&1
cd /usr/share/GeoIP

function getdat {
    URL=$1
    ZDAT=`echo $URL|sed 's/^.*\/G/G/'`
    DAT=`echo $ZDAT|sed 's/\.gz//'`
    
    OLD=`stat -c '%Y' $ZDAT 2>/dev/null`
    [ -z "$OLD" ] && OLD=0

    wget $QUIET --timestamping $URL
    RET=$?
    #echo $RET
    if [ $RET -eq 0 ];then
	NEW=`stat -c '%Y' $ZDAT 2>/dev/null`
	if [ $NEW -ne $OLD ];then
	echo "get new $DAT"
	gunzip -fc $ZDAT > $DAT
	fi
    else
	echo "error get $DAT: $RET"
    fi
}

getdat "http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz"
getdat "http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz"
