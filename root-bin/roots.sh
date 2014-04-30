#!/bin/sh

ROOTSYS=/usr/lib/root/
source  $ROOTSYS/bin/thisroot.sh

exec $ROOTSYS/bin/root "$@"
