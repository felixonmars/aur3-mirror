#!/bin/sh

_service_name=youtrack
_service_username=youtrack
_service_home_dir=/var/lib/youtrack

post_install() {
  getent passwd "$_service_username" > /dev/null || /usr/sbin/useradd \
    --system --user-group --home-dir "$_service_home_dir" --create-home \
    --shell '/bin/bash' --skel /dev/null "$_service_username" &> /dev/null
  echo 'This installation of YouTrack uses port 8082 by default.'
  echo 'The default login is root:root.'
}

pre_remove() {
  /usr/bin/systemctl stop $_service_name 2>/dev/null
}

post_remove() {
   getent passwd "$_service_username" > /dev/null && /usr/sbin/userdel "$_service_username" &>/dev/null
  for dir in "$_service_home_dir"; do
    [ -n "$dir" -a -d "$dir" ] && \
      echo "=> directory $dir needs to be removed manually"
  done
  return 0
}