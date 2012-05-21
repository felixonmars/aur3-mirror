#!/bin/bash


#    pacmanlog2gource - converts a copy of /var/log/pacman.log into a format readable by gource
#    Copyright (C) 2011-2012  Matthias Krüger

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
PACMANLOG=/var/log/pacman.log
LOGNOW=${DATADIR}/pacman_now.log
LOG=${DATADIR}/pacman_gource_tree.log

UPDATE="true"
COLOR="true"
GOURCEPOST="false"
FFMPEGPOST="false"
GOURCEPOST="false"
INFORMATION="false"

RED='\e[1;31m'
GREEN='\e[3;32m'
GREENUL='\e[4;32m'
WHITEUL='\e[4;02m'
NC='\e[0m'

TIMECOUNTCOOKIE=0

VERSION="1.8.3"

FILENAMES=' '


if [ `echo "$*" | grep -o "^-.[^\ ]*d\|\-d"` ] ; then
	echo "Debug mode..."
	set -x
fi
# check if we already have the datadir, if we don't have it, create it
if [ ! -d "${DATADIR}" ] ; then
	# workaround to not have colors displayed if we use -c option
	if [[ `echo "$*" | grep -o "^-.[^\ ]*c\|\-c"` ]] ; then
		echo -e "No directory ${DATADIR} found, creating one."
	else
		echo -e "No directory ${WHITEUL}${DATADIR}${NC} found, creating one."
	fi
	# if we cannot create the datadir (wtf!?), complain
	if  mkdir "${DATADIR}"  ; then
		:
	else
		echo -e "ERROR: Unable to create ${DATADIR}" >&2
		exit 1
	fi
fi

# print the version into a file so we can handle file formats being out of date properly later
echo "${VERSION}" >> ${DATADIR}/version
COMPATIBLE="0.8, 0.9, 1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.7.1, 1.7.2, 1.7.5, 1.7.6, 1.8, 1.8.1, 1.8.2, 1.8.3"
if [[ `awk '! /0\.8|0\.9|1\.0|1\.1|1\.2|1\.3|1\.4|1\.5|1\.6|1\.7|1\.7\.1|1\.7\.2|1\.7\.5|1\.7\.6|1\.8|1\.8\.1|1\.8\.2|\1\.8\.3/' ${DATADIR}/version` ]] ; then
	if [[ $(echo "$*") == *c* ]] ; then
		echo "Due to some slight changes in logfile generation, it is recommended to delete the files in ${DATADIR}/ and re-run this script." >&2
	else
		echo -e "Due to some slight changes in logfile generation, it is recommended to delete the files in ${WHITEUL}${DATADIR}/${NC} and re-run this script." >&2
	fi
	sleep 4
	echo "Exiting..." >&2
	exit 2
fi

# create empty logfile if non exists
if [ ! -f ${LOGNOW} ] ; then
	touch ${LOGNOW}
fi



# timer functions

timestart()
{
	TSG=`date +%s.%N`
}

timeend()
{
	TEG=`date +%s.%N`
	TDG=`calc -p $TEG - $TSG`
}

makelog() {

	# check if pacman is currently in use
	if [ -f "/var/lib/pacman/db.lck" ] ; then
		echo "ERROR, pacman is currently in use, please wait and re-run when pacman is done." >&2
		exit 3
	fi

	# start the timer
	timestart

	# copy the pacman log as pacman_tmp.log to our datadir
	cp ${PACMANLOG} ${DATADIR}/pacman_tmp.log

	echo -e "Getting diff between ${WHITEUL}${PACMANLOG}${NC} and an older local copy."
	# we only want to proceed new entries, old ones are already included in the log
	diff -u ${LOGNOW} ${PACMANLOG} | awk /'^+'/ | sed -e 's/^+//' > ${DATADIR}/process.log


	######################
	# core of the script #
	######################


	# get lines and size of the pacman log
	ORIGSIZE=`du ${DATADIR}/process.log | cut  -f1`
	ORIGLINES=`wc ${DATADIR}/process.log -l | cut -d' ' -f1`

	echo -e "Purging the diff (${ORIGLINES} lines, ${ORIGSIZE}kB) and saving the result to ${WHITEUL}${DATADIR}${NC}."
	sed -e 's/\[/\n[/g' -e '/^$/d' ${DATADIR}/process.log | awk '/] installed|] upgraded|] removed/' > ${LOGTOBEPROCESSED}

	PURGEDONESIZE=`du ${LOGTOBEPROCESSED} | cut -f1`

	LINE=1
	LINEPRCOUT=1
	MAXLINES=`wc -l ${LOGTOBEPROCESSED} | cut -d' ' -f1`

	echo -e "Processing ${MAXLINES} lines of purged log (${PURGEDONESIZE}kB)...\n"

	cp ${LOGTOBEPROCESSED} ${DATADIR}/tmp

	while [ "$LINE" -le "$MAXLINES" ]; do
		########################
		## processing the log ##
		########################

		# to read the file via loop
		IFS=$'\n'
		set -f
		for i in $(<${DATADIR}/tmp); do
			# the unix time string
			UNIXDATE=`date +"%s" -d "${i:1:16}"`
			# put  installed/removed/upgraded information in there again, we translated these later with sed in one rush
			STATE=`cut -d' ' -f3 <( echo ${i} )`
			# package name
			PKG=`cut -d' ' -f4  <( echo ${i} )`
			if [[ "${PKG}" == *lib* ]] ; then
				if [[ "${PKG}" == *libreoffice* ]] ; then
					PKG=libreoffice/${PKG}.libreoffice
				else
					PKG=lib/${PKG}.lib
				fi
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

			#    this is an awful hack to get the vars via multitasking, but it works :)
			echo "$UNIXDATE" > /dev/null &
			echo "$STATE" > /dev/null &
			echo "$PKG" > /dev/null &
			wait


			#    write the important stuff into our logfile
			echo "${UNIXDATE}|root|${STATE}|${PKG}" >> ${DATADIR}/pacman_gource_tree.log

			#    here we print how log the script already took to run and try to estimate how log it will run until everything is done
			#    but we only update this every 1000 lines to avoid unnecessary stdout spamming
			#    this will mostly be printed when initially obtaining the log
			if [ "${LINEPERCOUT}" == "1000" ] ; then
				LINECOUNTCOOKIE=1
				#    can we use  expr  here, or something more simple?
				LINEPERC=`calc -p "${LINE} / ${MAXLINES} *100" | sed -e 's/\~//'`
				timeend
				#    same as echo ${TDG} | grep -o "[0-9]*\.\?[0-9]\?[0-9]" # | head -n1
				TGDOUT=`awk 'match($0,/[0-9]*.?[0-9]?[0-9]/) {print substr($0,RSTART,RLENGTH)}' <( echo "${TDG}")`
				TIMEDONEONE=`calc -p "100 / ${LINEPERC:0:4} *${TDG}" | sed 's/\~//'`
				TIMEDONEFINAL=`calc -p "${TIMEDONEONE} - ${TDG}" | sed 's/\~//' | awk 'match($0,/[0-9]*.?[0-9]?[0-9]/) {print substr($0,RSTART,RLENGTH)}'`
				echo "Already ${LINEPERC:0:4}% done after ${TGDOUT}s."
				echo -e "Done in approximately ${TIMEDONEFINAL}s.\n"
				LINEPERCOUT=0
			fi
			#     switch to next line and re-start the loop
			LINE=`expr ${LINE} + 1`
			LINEPERCOUT=`expr ${LINEPERCOUT} + 1`
		done
		# file loop stuff..
		set +f
		unset IFS
	done
	# was the package installed/removed/upgraded?  here we actually translate this important information
	sed -e 's/|installed|/|A|/' -e 's/|upgraded|/|M|/' -e 's/|removed|/|D|/' ${DATADIR}/pacman_gource_tree.log > ${DATADIR}/tmp2.log
	mv ${DATADIR}/tmp2.log ${DATADIR}/pacman_gource_tree.log &
	mv ${DATADIR}/pacman_tmp.log ${LOGNOW} &
	rm ${DATADIR}/pacman_purged.log ${DATADIR}/process.log ${DATADIR}/tmp &
	wait

	# take the existing log and remove the paths so we have our pie-like log again which I had at the beginning of the developmen process of this script :)
	# yes, this may look stupid, first writing a package category and then removing it afterwards, but I think its faster to edit the entire file in one rush
	# instead of writing every single line into a file
	sed -e 's/D|.*\//D\|/' -e 's/M|.*\//M\|/' -e 's/A|.*\//A\|/' ${DATADIR}/pacman_gource_tree.log  > ${DATADIR}/pacman_gource_pie.log


	# how log did the script take to run?
	timeend

	if [[ ${LINECOUNTCOOKIE} == "1" ]] ; then
		TIMEFINAL=`awk 'match($0,/[0-9]*\.?[0-9]?[0-9]/) {print substr($0,RSTART,RLENGTH)}' <( echo "${TDG}" )`
	else
		TIMEFINAL=`awk 'match($0,/[0-9]*.[0-9]{5}/) {print substr($0,RSTART,RLENGTH)}' <( echo "${TDG}" )`
	fi

	if [[ ${MAXLINES} == "0" ]] ; then
		LINESPERSEC="0"
	else
		LINESPERSEC=`calc -p "${MAXLINES}/${TIMEFINAL}"`
	fi

	echo -e "100 % done after ${RED}${TIMEFINAL}${NC}s."
	echo -e "${RED}${LINESPERSEC:0:6}${NC} lines per second.\n"
} # makelog

help() {
	echo -e "-n  do${WHITEUL}N${NC}'t update the log"
	echo -e "-c  don't use ${WHITEUL}C${NC}olors for shell output"
	echo -e "-g  start ${WHITEUL}G${NC}ource afterwards"
	echo -e "-f  capture the video using ${WHITEUL}F${NC}fmpeg"
	echo -e "-p  makes use of -g and uses ${WHITEUL}P${NC}ie log"
	echo -e "-a  skip ${WHITEUL}A${NC}rchitecture in title"
	echo -e "-o  skip h${WHITEUL}O${NC}stname in title"
	echo -e "-t  skip ${WHITEUL}T${NC}imestaps in title"
	echo -e "-i  show some ${WHITEUL}I${NC}nformation regarding pacmanlog2gource"
	echo -e "-m  skip package na${WHITEUL}M${NC}es"
	echo -e "-d  show ${WHITEUL}D${NC}ebug information (set -x)"
	echo -e "-h  show this ${WHITEUL}H${NC}elp"
	# implement  -q  quiet
}

logbeginningdate=`head -n1 ${LOGNOW} |  cut -d' ' -f1 | sed  -e 's/\[//'`
logbeginning=`date +"%d %b %Y" -d "${logbeginningdate}"`

logenddate=`tail -n1 ${LOGNOW} | cut -d' ' -f1 | sed  -e 's/\[//'`
logend=`date +"%d %b %Y" -d "${logenddate}"`

cpucores=`getconf _NPROCESSORS_ONLN`

LOGTIMES=", ${logbeginning} - ${logend}"
HOSTNAME=", hostname: `hostname`"
ARCH=", `uname -m`"


while getopts "nchgfpaotimd" opt; do
	case "$opt" in
		"n")
			echo "Log not updated." >&2
			UPDATE="false"
			;;
		"c")
			RED=''
			GREEN=''
			GREENUL=''
			WHITEUL=''
			NC=''
			echo "Skipping colors in output."
			echo "NOTE: this won't affect stdout of gource or ffmpeg."
			;;
		"h")
			UPDATE="false"
			help
			exit 0
			;;
		"g")
			GOURCEPOST="true"
			;;
		"f")
			FFMPEGPOST="true"
			GOURCEPOST="true"
			;;
		"p")
			LOG=${DATADIR}/pacman_gource_pie.log
			GOURCEPOST="true"
			;;
		"a")
			ARCH=''
			;;
		"o")
			HOSTNAME=''
			;;
		"t")
			LOGTIMES=''
			;;
		"i")
			UPDATE="false"
			INFORMATION="true"
			;;
		"m")
			FILENAMES=",filenames"
			GOURCEPOST="true"
			echo "Filenames will be skipped in the video." >&2
			;;
		"d")
		#	DEBUG="true"
		#	echo "Entering debug mode..." >&2
			;;
		"?")
			UPDATE="false"
			echo "Pacmanlog2gource: invalid option!" >&2
			echo "Please try  pacmanlog2gource -h  for possible options." >&2
			exit 1
			;;
		*)
			echo "Pacmanlog2gource: unknown error while processing options." >&2
			exit 1
			;;
	esac
done


if [ ${INFORMATION} == "true" ] ; then
	TITLE="Pacmanlog2gource${LOGTIMES}${HOSTNAME}${ARCH}"
	echo "The default command which will be run using pacmanlog2gource -g is"
	echo -e "${GREEN}gource ${GREENUL}${DATADIR}/pacman_gource_tree.log${NC}${GREEN} -1200x720 -c 1.1 --title \"${TITLE}\" --key --camera-mode overview --highlight-all-users --file-idle-time 0 -auto-skip-seconds 0.001 --seconds-per-day 0.3 --hide progress,mouse --stop-at-end --max-files 99999999999 --max-file-lag 0.00001  --max-user-speed 300 --user-friction 2${NC}"
	echo "If you run -f, this is appended:"
	echo -e "${GREEN}--output-ppm-stream - | ffmpeg -f image2pipe -vcodec ppm -i - -y -vcodec libx264 -preset medium -crf 22 -pix_fmt yuv420p -threads ${cpucores} -b:v 3000k -maxrate 8000k -bufsize 10000k ${GREENUL}pacmanlog2gource_`date +%b\_%d\_%Y`.mp4${NC}"
	echo -e "Logfiles are stored in ${WHITEUL}${DATADIR}/pacman_gource_tree.log${NC} and ${WHITEUL}${DATADIR}/pacman_gource_pie.log${NC}."
	echo -e "Log format of current version ${VERSION} compatible with versions \n${COMPATIBLE}"
	exit 0
fi

if [ ${UPDATE} == "true" ] ; then
	makelog
	echo -e "Output files are ${WHITEUL}${DATADIR}/pacman_gource_tree.log${NC}"
	echo -e "\t and ${WHITEUL}${DATADIR}/pacman_gource_pie.log${NC}.\n\n"
fi

if [ ${GOURCEPOST} == "true" ] ; then
	TITLE="Pacmanlog2gource${LOGTIMES}${HOSTNAME}${ARCH}"
	if [ ${FFMPEGPOST} == "true" ] ; then
		gource ${LOG} -1200x720  -c 1.1 --title "${TITLE}" --key --camera-mode overview --highlight-all-users --file-idle-time 0 -auto-skip-seconds 0.001 --seconds-per-day 0.3 --hide progress,mouse${FILENAMES} --stop-at-end --max-files 99999999999 --max-file-lag 0.00001  --max-user-speed 300 --user-friction 2 --output-ppm-stream - | ffmpeg -f image2pipe -vcodec ppm -i - -y -vcodec libx264 -preset medium -crf 22 -pix_fmt yuv420p -threads ${cpucores} -b:v 3000k -maxrate 8000k -bufsize 10000k pacmanlog2gource_`date +%b\_%d\_%Y`.mp4
	else
		echo -e "To record the video to a mp4 file using ffmpeg, run  ${GREEN}pacmanlog2gource -f${NC}  ."
		gource ${LOG} -1200x720  -c 1.1 --title "${TITLE}" --key --camera-mode overview --highlight-all-users --file-idle-time 0 -auto-skip-seconds 0.001 --seconds-per-day 0.3 --hide progress,mouse${FILENAMES} --stop-at-end --max-files 99999999999 --max-file-lag 0.00001  --max-user-speed 300 --user-friction 2
	fi
else
	echo -e "To visualize the log, run  ${GREEN}pacmanlog2gource -g${NC}"
fi

echo -e "For more information run ${GREEN}pacmanlog2gource -i${NC} or ${GREEN}pacmanlog2gource -h${NC}"
echo "Thanks for using pacmanlog2gource!"
