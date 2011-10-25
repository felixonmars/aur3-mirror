#!/bin/bash


#    pacmanlog2gource - converts /var/log/pacman.log into gource-readeable format
#    Copyright (C) 2011  Matthias Krüger

#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 1, or (at your option)
#    any later version.

#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.

#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston MA  02110-1301 USA

#set -x

# variables

DATADIR=~/.pacmanlog2gource

LOGTOBEPROCESSED=${DATADIR}/pacman_purged.log

TIMECOUNTCOOKIE=0

# timer functions

timestart()
{
	TSG=`date +%s.%N`
}

timeend()
{
	TEG=`date +%s.%N`
	TDG=`calc $TEG - $TSG`
}

# start the timer
timestart


#check if we already have datadir, if not, create one
if [ ! -d ${DATADIR} ] ; then
	echo -e "No directory \e[4;02m${DATADIR}\e[0m found, creating one."
	mkdir ${DATADIR}
fi

# print the version into a file so we handle file formats being out of date properly later
echo "1.2" >> ${DATADIR}/version
if [[ `cat ${DATADIR}/version | awk '! /0\.8|0\.9|1\.0|1\.1|1\.2/'` ]] ; then
	echo -e "Due to some slight changes in logfile generation, it is recommended to delete the files in \e[4;02m${DATADIR}/\e[0m and re-run this script."
	sleep 4
fi


# create empty logfile if non exists
if [ ! -a ${DATADIR}/pacman_now.log ] ; then
	touch ${DATADIR}/pacman_now.log
fi

# copy the pacmam log as pacman_tmp.log to our datadir
# this way, log entries that have been made while the script run won't get lost' so we can proceed them next time we run the script

cp /var/log/pacman.log ${DATADIR}/pacman_tmp.log


echo -e "Getting diff between \e[4;02m/var/log/pacman.log\e[0m and local copy."
# we only want to proceed new entries, old ones are already included in the log
diff -u ${DATADIR}/pacman_now.log /var/log/pacman.log | awk /'^+'/ | sed -e 's/^+//' > ${DATADIR}/process.log



#
# core of the script
#


# get lines and size of the pacman log
ORIGSIZE=`du ${DATADIR}/process.log | awk '{print $1}'`
ORIGLINES=`cat ${DATADIR}/process.log | wc -l`

echo -e "Purging the diff (${ORIGLINES} lines, ${ORIGSIZE}kB) and saving the result to \e[4;02m${DATADIR}\e[0m."
cat ${DATADIR}/process.log | sed -e 's/\[/\n[/g' -e '/^$/d' | awk '/] installed|] upgraded|] removed/' > ${LOGTOBEPROCESSED}

PURGEDONESIZE=`du ${LOGTOBEPROCESSED} | awk '{print $1}'`
PURGEDONELINES=`cat ${LOGTOBEPROCESSED} | wc -l`


LINE=1
LINEPRCOUT=1
MAXLINES=`cat ${LOGTOBEPROCESSED} | wc -l`

echo -e "Processing ${MAXLINES} lines of purged log (${PURGEDONESIZE}kB)...\n"

# proceed each line of LOGTOBEPROCESSED and extract important information

while [ "$LINE" -le "$MAXLINES" ]; do
#### processing the log ####

# the line we are on
	CURLINE=`cat ${LOGTOBEPROCESSED} | awk NR==${LINE}`
# the date of the entry, get characters 2-17
	DATE="${CURLINE:1:16}"
# convert the date into unix time which can be read by gource
	UDATE=`date +"%s" -d "${DATE}"`
# find out if the package was installed, upgraded or removed
	STATE=`echo ${CURLINE} | awk '{print $3}' | sed -e 's/installed/A/' -e 's/upgraded/M/' -e 's/removed/D/'`
# get the actual package name
	PKG=`echo ${CURLINE} | awk '{print $4}'`
# add extensions to the package name
# this way we can have the packages grouped and nicely colored in gource
#
# todo: do things like:
# first find everything that contains an x, then, continue searching only these for xorg, xf86 etc and not everything
#
	if [[ "${PKG}" == *lib* ]] && [[ "${PKG}" != *libreoffice* ]] ; then
		PKG=lib/${PKG}.lib
	elif [[ "${PKG}" == *xorg* ]]		 ; then
		PKG=xorg/${PKG}.xorg
	elif [[ "${PKG}" == *ttf* ]]		 ; then
		PKG=ttf/${PKG}.ttf
	elif [[ "${PKG}" == *xfce* ]]		 ; then
		PKG=xfce/${PKG}.xfce
	elif [[ "${PKG}" == *sdl* ]]		 ; then
		PKG=sdl/${PKG}.sdl
	elif [[ "${PKG}" == *xf86* ]]		 ; then
		PKG=xf86/${PKG}.xf86
	elif [[ "${PKG}" == *perl* ]]		 ; then
		PKG=perl/${PKG}.perl
	elif [[ "${PKG}" == *gnome* ]]		 ; then
		PKG=gnome/${PKG}.gnome
	elif [[ "${PKG}" == *libreoffice* ]] ; then
		PKG=libreoffice/${PKG}.libreoffice
	elif [[ "${PKG}" == *gtk* ]]		 ; then
		PKG=gtk/${PKG}.gtk
	elif [[ "${PKG}" == *gstreamer* ]]	 ; then
		PKG=gstreamer/${PKG}.gstreamer
	elif [[ "${PKG}" == *kde* ]]		 ; then
		PKG=kde/${PKG}.kde
	elif [[ "${PKG}" == *python* ]]		 ; then
		PKG=python/${PKG}.python
	elif [[ "${PKG}" == *py* ]]			 ; then
		PKG=python/${PKG}.python
	elif [[ "${PKG}" == *lxde* ]]		 ; then
		PKG=lxde/${PKG}.lxde
	elif [[ "${PKG}" == ^lx* ]]			 ; then
		PKG=lxde/${PKG}.lxde
	elif [[ "${PKG}" == *php* ]]		 ; then
		PKG=php/${PKG}.php
	elif [[ "${PKG}" == *alsa* ]]		 ; then
		PKG=alsa/${PKG}.alsa
	elif [[ "${PKG}" == *compiz* ]]		 ; then
		PKG=compiz/${PKG}.compiz
	elif [[ "${PKG}" == *dbus* ]]		 ; then
		PKG=dbus/${PKG}.dbus
	elif [[ "${PKG}" == *gambas* ]]		 ; then
		PKG=gambas/${PKG}.gambas
	elif [[ "${PKG}" == *qt* ]]			 ; then
		PKG=qt/${PKG}.qt
	elif [[ "${PKG}" == *firefox* ]]	 ; then
		PKG=mozilla/${PKG}.mozilla
	elif [[ "${PKG}" == *thunderbird* ]] ; then
		PKG=mozilla/${PKG}.mozilla
	elif [[ "${PKG}" == *seamonky* ]]	 ; then
		PKG=mozilla/${PKG}.mozilla
	fi


# write the important stuff into our logfile
	echo "${UDATE}|root|${STATE}|${PKG}" >> ${DATADIR}/pacman_gource_tree.log


# here we print how log the script already took to run and try to estimate how log it will run until it finishes'
# but we only update this every 500 lines to avoid unnecessary spamming
# this will mostly be printed when initially obtaining the log
	if [ "${LINEPERCOUT}" == "500" ] ; then
		LINECOUNTCOOKIE=1
		LINEPERC=`calc -p "${LINE} / ${MAXLINES} *100" | sed -e 's/\~//'`
		timeend
		# same as echo ${TDG} | grep -o "[0-9]*\.\?[0-9]\?[0-9]" # | head -n1
		TGDOUT=`echo ${TDG} | awk 'match($0,/[0-9]*.?[0-9]?[0-9]/) {print substr($0,RSTART,RLENGTH)}'`
		TIMEDONEONE=`calc -p "100 / ${LINEPERC:0:4} *${TDG}" | sed 's/\~//'`
		TIMEDONEFINAL=`calc -p "${TIMEDONEONE} - ${TDG}" | sed 's/\~//' | awk 'match($0,/[0-9]*.?[0-9]?[0-9]/) {print substr($0,RSTART,RLENGTH)}'`
		echo "Already ${LINEPERC:0:4}% done after ${TGDOUT}s."
		echo -e "Done in approximately ${TIMEDONEFINAL}s.\n"
		LINEPERCOUT=0
	fi

# switch to next line and re-start the loop
	LINE=`expr ${LINE} + 1`
	LINEPERCOUT=`expr ${LINEPERCOUT} + 1`
done


mv ${DATADIR}/pacman_tmp.log ${DATADIR}/pacman_now.log

rm ${DATADIR}/pacman_purged.log ${DATADIR}/process.log

# take the existing log and remove the paths so we have our pie-like log again which I had at the beginning of the developmen process of this script :)
cat ${DATADIR}/pacman_gource_tree.log | sed -e 's/D|.*\//D\|/' -e 's/M|.*\//M\|/' -e 's/A|.*\//A\|/' > ${DATADIR}/pacman_gource_pie.log


# how log did the script took to run?
timeend

if [[ ${LINECOUNTCOOKIE} == "1" ]] ; then
	TIMEFINAL=`echo "${TDG}" | awk 'match($0,/[0-9]*\.?[0-9]?[0-9]/) {print substr($0,RSTART,RLENGTH)}'`
else
	TIMEFINAL=`echo "${TDG}" | awk 'match($0,/[0-9]*.[0-9]{5}/) {print substr($0,RSTART,RLENGTH)}'`
fi


echo -e "100 % done after \e[1;31m${TIMEFINAL}\e[0ms.\n"

echo -e "Output files are \e[4;02m${DATADIR}/pacman_gource_tree.log\e[0m"
echo -e "\t and \e[4;02m${DATADIR}/pacman_gource_pie.log\e[0m.\n\n"

# this is how we can visualize the log
echo "If you have \"gource\" installed (should be, since it is set as dependency), run"
echo -e "\t\e[3;32mgource \e[4;32m${DATADIR}/pacman_gource_tree.log\e[0;32m -1200x720 --key --camera-mode overview --highlight-all-users --file-idle-time 0 -auto-skip-seconds 0.001 --seconds-per-day 0.5 --hide progress,mouse --stop-at-end --max-files 99999999999 --max-file-lag 0.00001\e[0m"
echo -e "to visualize the log using gource.\n"
echo "If you additionally want to make a video of the visualization and have the needed programs installed, append"
echo -e "\t\e[3;32m--output-ppm-stream - | ffmpeg -f image2pipe -vcodec ppm -i - -y -vcodec libx264 -threads 4 -b 3000k -maxrate 8000k -bufsize 10000k \e[4;32mpacmanlog2gource_`date +%b\_%d\_%Y`.mp4\e[0m"
echo "to the first command."
echo -e "Alternatively, you can also replace \e[4;02m${DATADIR}/pacman_gource_tree.log\e[0m with \e[4;02m${DATADIR}/pacman_gource_pie.log\e[0m as source-logfile to get all packages in a pie-formation."
echo -e "To skip the package names, replace \e[0;32m--hide progress,mouse\e[0m by \e[0;32m--hide progress,mouse,filenames\e[0m."
echo -e "\e[3;32mgource -H\e[0m will give you more information on how to use gource."
