#!/bin/bash
# ETQW game files copy to PKGBUILD directory

# Mount point (no trailing slash)
discmp=/run/media/$USER/ETQWDVD

curdir="$(pwd)"
tarname="etqw-dvd-files"

while true; do
  read -p "Disc 1 ready ("$discmp")? (y/n): " disc
  case $disc in
    [Yy] ) break 2 ;;
    [Nn] ) exit  1 ;;
    *    ) echo "Answer (y)es or (n)o."
  esac; done
while ! mount | grep " $discmp " > /dev/null; do
  read -p "non-mountpoint: "$discmp".  Retry? (y/n) :"  remount
  case $remount in
    [Yy] ) continue ;;
    [Nn] ) exit  1  ;;
    *    ) echo "Answer (y)es or (n)o."
  esac; done

cd "$discmp"/Setup/Data/base/
tar -cvf "$curdir"/"$tarname".tar pak*.pk4 zpak*.pk4 megatextures/* video/*

eject "$discmp"