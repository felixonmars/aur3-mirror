#!/bin/sh
USER_HOME=$HOME
STARTUP_FOLDER=${USER_HOME}/.config/autostart
LOCALAPPS_FOLDER=${USER_HOME}/.local/share/applications
INSTALL_FOLDER=$1

(cat <<!FUNKY!
if [ ! -d "${INSTALL_FOLDER}" ]; then
	mkdir -p ${INSTALL_FOLDER} 
fi
rm -rf ${INSTALL_FOLDER}*

if [ ! -d "${STARTUP_FOLDER}" ]; then
	mkdir -p ${STARTUP_FOLDER}
fi

if [ ! -d "${LOCALAPPS_FOLDER}" ]; then
	mkdir -p ${LOCALAPPS_FOLDER}
fi

cp -R ./ ${INSTALL_FOLDER}feem
chmod uag+x ${INSTALL_FOLDER}

cp Feem.desktop ${STARTUP_FOLDER}/Feem.desktop
chmod u+x ${STARTUP_FOLDER}/Feem.desktop

cp Feem.desktop ${LOCALAPPS_FOLDER}/Feem.desktop
!FUNKY!
) >install

chmod +x install
