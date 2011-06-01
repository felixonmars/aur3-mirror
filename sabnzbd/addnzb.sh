#!/bin/bash

. /etc/conf.d/sabnzbd

# SABnzbd must be able to read the file, so we copy it to a directory where it
# certainly has rights.
nzbname=`basename "$1"`
TEMP_NZB="/var/tmp/$nzbname"

cp "$1" "$TEMP_NZB"
curl -f `perl -MURI::Escape -e "print '$SABNZBD_PROTOCOL://'.uri_escape('$SABNZBD_USPW$SABNZBD_IP').':$SABNZBD_PORT/sabnzbd/api?mode=addlocalfile&name='.uri_escape('$TEMP_NZB').'&pp=1&priority=-1&apikey='.uri_escape('$NZB_KEY')"`
rm "$TEMP_NZB"
exit 0
