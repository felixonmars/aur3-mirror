#!/bin/sh
#-------------------------------------------------------------------------------
# Revenge Of The Cats: Ethernet
# Copyright (C) 2009, mEthLab Interactive
#-------------------------------------------------------------------------------

ROTCDIR="/usr/share/rotc-ethernet/"

BIN="./rotc.bin"
ARGS="-console $@"

die()
{
	echo "$*" 2>&1
	exit 1
}

cd "$ROTCDIR" || die "Can't change into ROTC: Ethernet root dir."

LD_LIBRARY_PATH="`pwd`/lib"
export LD_LIBRARY_PATH

$BIN "$ARGS"

