#!/bin/sh

cd /opt/towns

#FIX for some VM's other then METACITY
#save old value before unsetting
oldXMODIFIERS=$XMOFIFIERS
unset XMODIFIERS

java -Djava.library.path=lib/native/ -Xms512M -Xmx512M -jar lib/xaos.jar

#If there were XMODIFIERS, set them again
if  [ ${#oldXMODIFIERS} -ge 1 ]; then
   echo "Setting XMODIFIERS to old value."
   export XMODIFIERS=$oldXMODIFIERS
fi
