#!/bin/sh

PROPFILE='/etc/conf.d/air-video-server'
LOCALPROP=`echo ~/.air-video-server/air-video-server.properties`

if [ -a "$1" ]; then
  PROPFILE=$1
else 
  [ -a $LOCALPROP ] && PROPFILE=$LOCALPROP
fi

exec $JAVA_HOME/bin/java -jar /usr/share/air-video-server/AirVideoServerLinux.jar "$PROPFILE"
