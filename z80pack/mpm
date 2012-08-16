#!/bin/sh

cd $HOME
mkdir -p $HOME/z80pack/mpm/disks

# If run for the first time, setup the disks
cd $HOME/z80pack/mpm
if [ ! -f disks/drivea.cpm ]; then
    mkfifo auxin
    mkfifo auxout
    cp /usr/share/z80pack/bin/* .
    cp /usr/share/z80pack/disks/mpm-1.dsk disks/drivea.cpm
    cp /usr/share/z80pack/disks/mpm-2.dsk disks/driveb.cpm
    cp /usr/share/z80pack/disks/hd-tools.dsk disks/drivei.cpm
fi

cpmsim
