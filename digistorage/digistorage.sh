#!/usr/bin/env bash

# Don't allow running as root
if [ "$(id -u)" == "0" ]; then
	show_message --error $"Cannot run as root user"
	exit 1
fi

SRC_DIR=/usr/share/digistorage
DST_DIR=${HOME}/.local/share/digistorage/

if [[ -d ${DST_DIR} ]]; then #alredy installed, launch gui
  exec ${DST_DIR}/storagegui
else #not installed
  mkdir ${DST_DIR}
  cp -R ${SRC_DIR}/* ${DST_DIR}/
  cp /usr/share/applications/digistorage.desktop ${HOME}/.config/autostart
  exec ${DST_DIR}/storagegui
fi