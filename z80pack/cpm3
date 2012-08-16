#!/bin/sh

cd $HOME
mkdir -p $HOME/z80pack/cpm3/disks

# If run for the first time, setup the disks
cd $HOME/z80pack/cpm3
if [ ! -f disks/drivea.cpm ]; then
    mkfifo auxin
    mkfifo auxout
    cp /usr/share/z80pack/bin/* .
    cp /usr/share/z80pack/disks/cpm3-1.dsk disks/drivea.cpm
    cp /usr/share/z80pack/disks/cpm3-2.dsk disks/driveb.cpm
    cp /usr/share/z80pack/disks/hd-tools.dsk disks/drivei.cpm
fi

cpmsim
