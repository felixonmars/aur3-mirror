#!/bin/bash
# Calls /opt/bin/mediaclient for all found 
# sundtek DVB devices with the given command line


for frontend in $(/opt/bin/mediaclient -e|grep FRONTEND|uniq|cut -f2- -d'/')
do
	frontend="/${frontend}"
	echo ${frontend}
	/opt/bin/mediaclient -d ${frontend} $*
done
