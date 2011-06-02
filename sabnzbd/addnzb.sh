#!/bin/bash

. /etc/conf.d/sabnzbd

# SABnzbd must be able to read the file, so we copy it to a directory where it
# certainly has rights.
nzbname=`basename "$1"`
TEMP_NZB="/var/tmp/$nzbname"

curl -s "$1" -o "$TEMP_NZB"
curl -f `python2 -c "import urllib;print '$SABNZBD_PROTOCOL://'+urllib.quote('$SABNZBD_USPW$SABNZBD_IP')+':$SABNZBD_PORT/sabnzbd/api?mode=addlocalfile&name='+urllib.quote('$TEMP_NZB')+'&apikey='+urllib.quote('$NZB_KEY')"`
rm "$TEMP_NZB"
exit 0
