#!/bin/bash
## Author Heinrich Schwietering (2009)
## Script to start a dvb-t supporting version of AleVT
## Modified and translated by Heiko Baums (2009)

MCD=/usr/bin/alevt

zenity --help > /dev/null || { echo "Error: You need \"zenity\" to use this script." && exit 1 ; }
test -e $MCD || { zenity --error --text "Error: You need \"aleVT\" with dvb support to use this script." && exit 1 ; }
test ! -e ~/TeletextPIDS.lst && zenity --error --text "~/TeletextPIDS.lst not found" && exit 1
STATION=`cat ~/TeletextPIDS.lst | cut -d ";" -f 1 | zenity --list --title "Please select a station" --column "Station:"` || exit 0
test "$STATION" || { zenity --error --text "No station selected." && exit 1 ; }
PID=`grep "$STATION" ~/TeletextPIDS.lst | cut -d ";" -f 2`
$MCD -vbi /dev/dvb/adapter0/demux0 -pid $PID -parent 100 > /dev/null
