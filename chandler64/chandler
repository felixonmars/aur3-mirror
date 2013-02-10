#!/bin/sh

export CHANDLERHOME=/usr/lib/chandler/
export CHANDLERBIN=$CHANDLERHOME

export LC_PATH="$CHANDLERBIN"/release/share/locale
unset PYTHONHOME

export PYTHONPATH="$CHANDLERBIN"/release/site-packages:"$CHANDLERHOME":"$CHANDLERHOME"/parcels
export PYTHONBIN=/usr/bin/python2

if [[ $(uname -m) == "x86_64" ]]; then
    arch=amd64
    vm=server
else
    arch=i386
    vm=client
fi

if [[ -d "$CHANDLERBIN"/release/j2re-image ]]; then
    JRE="$CHANDLERBIN"/release/j2re-image
else
    JRE=/usr/lib/jvm/java-6-openjdk/jre
fi

export LD_LIBRARY_PATH="$CHANDLERBIN"/release/lib:"$CHANDLERBIN"/release/db/lib:"$JRE"/lib/$arch:"$JRE"/lib/$arch/$vm

if [[ -d "$CHANDLERBIN/release/icu" ]]; then
    export LD_LIBRARY_PATH="$CHANDLERBIN"/release/icu/lib:"$LD_LIBRARY_PATH"
fi

if [[ "$PARCELPATH" != "" ]]; then
    export PYTHONPATH="$PYTHONPATH":"$PARCELPATH"
fi

cd $CHANDLERHOME

"$PYTHONBIN" -O Chandler.py "$@"
