#!/bin/bash
## Author Heinrich Schwietering (2009)
## Script to start a dvb-t supporting version of AleVT
## Modified and translated by Heiko Baums (2009)

MCD=/usr/bin/alevt-cap

zenity --help > /dev/null || { echo "Error: You need \"zenity\" to use this script." && exit 1 ; }
test -e $MCD || { zenity --error --text "Error: You need \"aleVT\" with dvb support to use this script." && exit 1 ; }
test ! -e ~/TeletextPIDS.lst && zenity --error --text "~/TeletextPIDS.lst not found" && exit 1
STATION=`cat ~/TeletextPIDS.lst | cut -d ";" -f 1 | zenity --list --title "Please select a station" --column "Station:"` || exit 0
test "$STATION" || { zenity --error --text "No station selected." && exit 1 ; }
PID=`grep "$STATION" ~/TeletextPIDS.lst | cut -d ";" -f 2`
PAGE=`zenity --entry --title "Please enter a page number" --text "Enter the page and subpage (ppp[.ss])"` || exit 0
test "$PAGE" || { zenity --error --text "No page number entered." && exit 1 ; }
FORMAT=`zenity --list --title "Please select a format" --column "Format" ascii ansi html ppm png` || exit 0
test "$FORMAT" || { zenity --error --text "No format selected." && exit 1 ; }
FILENAME=`zenity --title "Please select a file for saving the page" --file-selection --save` || exit 0
test "$FILENAME" || { zenity --error --text "No file chosen." && exit 1 ; }
$MCD -name "$FILENAME" -format $FORMAT -vbi /dev/dvb/adapter0/demux0 -pid $PID $PAGE > /dev/null
zenity --info --text "Teletext page captured."
