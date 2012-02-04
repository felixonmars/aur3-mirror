#!/bin/bash

if [[ $UID != 0 ]]; then
  echo You need to run this script as root.
  exit 1
fi

cd /usr/share/webapps/mindtouch/maintenance
su -s /bin/bash -c "php update-db.php" http
echo
