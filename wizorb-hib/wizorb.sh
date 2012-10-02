#!/bin/sh

if [ ! -d ${HOME}/.Tribute\ Games ]; then
    mkdir ${HOME}/.Tribute\ Games
fi

if [ ! -z ${HOME}/Tribute\ Games ]; then
    ln -s ${HOME}/.Tribute\ Games ${HOME}/Tribute\ Games
else
    echo "Temporary config folder location already exists"
    exit 1
fi

pushd /opt/wizorb
    mono Wizorb.exe ; rm ${HOME}/Tribute\ Games
popd
