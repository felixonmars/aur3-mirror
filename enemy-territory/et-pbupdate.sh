#!/bin/bash

cd "/opt/enemy-territory/pb/"
./pbweb.x86 $*
# Change permissions on files in dll folder to suppress PunkBuster errors
chmod 775 dll/*
# Move updated PunkBuster files
if [ -e "/opt/enemy-territory/pb/pbclnew.so" ]; then
    mv -f /opt/enemy-territory/pb/pbcl.so /opt/enemy-territory/pb/pbclold.so
    mv -f /opt/enemy-territory/pb/pbclnew.so /opt/enemy-territory/pb/pbcl.so
fi

if [ -e "/opt/enemy-territory/pb/pbclsnew.so" ]; then
    mv -f /opt/enemy-territory/pb/pbcls.so /opt/enemy-territory/pb/pbclsold.so
    mv -f /opt/enemy-territory/pb/pbclsnew.so /opt/enemy-territory/pb/pbcls.so
fi

if [ -e "/opt/enemy-territory/pb/pbsvnew.so" ]; then
    mv -f /opt/enemy-territory/pb/pbsv.so /opt/enemy-territory/pb/pbsvold.so
    mv -f /opt/enemy-territory/pb/pbsvnew.so /opt/enemy-territory/pb/pbsv.so
fi

exit $?
