#!/bin/sh

#gsettings set com.canonical.Unity.Panel systray-whitelist "['all']"

DIR=/opt/feem

cd $DIR
pkill Feem
if [ -n "." ] ; then

	if [ "${LD_LIBRARY_PATH+set}" = "set" ] ; then
    		export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${DIR}/lib/"
    	else
    		export LD_LIBRARY_PATH="${DIR}/lib/"
    fi
fi

echo $LD_LIBRARY_PATH
cd bin
ldd ./Feem
exec ./Feem "$@"
