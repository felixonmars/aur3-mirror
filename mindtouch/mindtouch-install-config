#!/bin/bash

if [[ $UID != 0 ]]; then
  echo You need to run this script as root.
  exit 1
fi

cd /usr/share/webapps/mindtouch/config

CONFIG_FILES="LocalSettings.php mindtouch.host.conf mindtouch.deki.startup.xml"
SUCCESS=true
for file in $CONFIG_FILES; do
  install -m 644 $file /etc/webapps/mindtouch
  if [[ "$?" != "0" ]]; then
    SUCCESS=false
  fi
done

if [[ $SUCCESS == true ]]; then
  rm $CONFIG_FILES
fi
