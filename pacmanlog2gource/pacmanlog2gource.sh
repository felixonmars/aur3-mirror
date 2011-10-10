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

WORKINGDIR=~/.pacmanlog2gource

LOGTOBEPROCESSED=${WORKINGDIR}/pacman_purged.log



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



timestart

# print the version into a file so we handle file formats being out of date properly later


#check if we already have a working dir, of not, create one
if [ -d ${WORKINGDIR} ] ; then
	echo "Working directory exists."
else
	echo "No working directory found, creating one. \( ${WORKINGDIR} \)"
	mkdir ${WORKINGDIR}
fi

echo "0.6" > ${WORKINGDIR}/version


# make the file
# TODO: we should probably not touch it but use if/else to check if its there, see above
touch ${WORKINGDIR}/pacman_now.log

# copy the pacmam log as pacman_tmp to our working dir.
# this way, log entries that have been made while the script run won't get lost' so we can proceed it later

cp /var/log/pacman.log ${WORKINGDIR}/pacman_tmp.log

# we only want to proceed new entries, old ones are already included in the log
diff -u ${WORKINGDIR}/pacman_now.log /var/log/pacman.log | grep "^+" | sed -e 's/^+//' > ${WORKINGDIR}/proceed.log




# this is our temporary file

#now we actually start running the script


# get lines and size of the pacman log
ORIGSIZE=`du ${WORKINGDIR}/proceed.log | awk '{print $1}'`
ORIGLINES=`cat ${WORKINGDIR}/proceed.log | wc -l`

echo "Purging pacman.log ( ${ORIGLINES} lines, ${ORIGSIZE}kB) and saving the result to /tmp/."
cat  ${WORKINGDIR}/proceed.log | sed -e 's/\[/\n[/g' | sed -e '/^$/d' | grep "]\ installed\|]\ upgraded\|]\ removed"  > ${LOGTOBEPROCESSED}

PURGEDONESIZE=`du ${LOGTOBEPROCESSED} | awk '{print $1}'`
PURGEDONELINES=`cat ${LOGTOBEPROCESSED} | wc -l`


LINE=1
LINEPRCOUT=1
MAXLINES=`cat ${LOGTOBEPROCESSED} | wc -l`

echo -e "Processing ${MAXLINES} lines of purged log (${PURGEDONESIZE}kb)...\n"

# proceed each line of LOGTOBEPROCESSED and extract important information

while [ "$LINE" -le "$MAXLINES" ]; do
#### processing the log ####

# the line we are on
	CURLINE=`cat ${LOGTOBEPROCESSED} | awk NR==${LINE}`
# the date of the entry
	DATE=`echo ${CURLINE} | grep -o "[0-9]\{4\}\-[0-9][0-9]\-[0-9]\{2\}\ [0-9]\{2\}\:[0-9]\{2\}"`
# convert the date into unix time
	UDATE=`date +"%s" -d "${DATE}"`
# find out if the package was installed, upgraded or removed
	STATE=`echo ${CURLINE} | awk '{print $3}' | sed 's/installed/A/' | sed 's/upgraded/M/' | sed 's/removed/D/'`
# get the actual package name
	PKG=`echo ${CURLINE} | awk '{print $4}'`
# add extensions to the package name
# this way we can have the packages grouped and nicely colored in gource
	if [[ `echo "${PKG}" | grep -o "lib" | grep -v "libreoffice" | head -n1` == "lib" ]] ; then
		PKG=`echo "lib/${PKG}.lib"`
	else
		if [[ `echo "${PKG}" | grep -o "xorg" | head -n1` == "xorg" ]] ; then
			PKG=`echo "xorg/${PKG}.xorg"`
		else
			if [[ `echo "${PKG}" | grep -o "ttf" | head -n1` == "ttf" ]] ; then
				PKG=`echo "ttf/${PKG}.ttf"`
			else
				if [[ `echo "${PKG}" | grep -o "xfce" | head -n1` == "xfce" ]] ; then
					PKG=`echo "xfce/${PKG}.xfce"`
				else
					if [[ `echo "${PKG}" | grep -o "sdl" | head -n1` == "sdl" ]] ; then
						PKG=`echo "sdl/${PKG}.sdl"`
					else
						if [[ `echo "${PKG}" | grep -o "xf86" | head -n1` == "xf86" ]] ; then
							PKG=`echo "xf86/${PKG}.xf86"`
						else
							if [[ `echo "${PKG}" | grep -o "perl" | head -n1` == "perl" ]] ; then
								PKG=`echo "perl/${PKG}.perl"`
							else
								if [[ `echo "${PKG}" | grep -o "gnome" | head -n1` == "gnome" ]] ; then
									PKG=`echo "gnome/${PKG}.gnome"`
								else
									if [[ `echo "${PKG}" | grep -o "libreoffice" | head -n1` == "libreoffice" ]] ; then
										PKG=`echo "libreoffice/${PKG}.libreoffice"`
									else
										if [[ `echo "${PKG}" | grep -o "gtk" | head -n1` == "gtk" ]] ; then
											PKG=`echo "gtk/${PKG}.gtk"`
										else
											if [[ `echo "${PKG}" | grep -o "gstreamer" | head -n1` == "gstreamer" ]] ; then
												PKG=`echo "gstreamer/${PKG}.gstreamer"`
											else
												if [[ `echo "${PKG}" | grep -o "kde" | head -n1` == "kde" ]] ; then
													PKG=`echo "kde/${PKG}.kde"`	
												else
													if [[ `echo "${PKG}" | grep -o "python | head -n1"` == "python" ]] ; then
														PKG=`echo "python/${PKG}.python"`
													else
														if [[ `echo "${PKG}" | grep -o "^py" | head -n1` == "py" ]] ; then
															PKG=`echo "python/${PKG}.python"`
														else
															if [[ `echo "${PKG}" | grep -o "lxde" | head -n1` == "lxde" ]] ; then
																PKG=`echo "lxde/${PKG}.lxde"`
															else
																if [[ `echo "${PKG}" | grep -o "^lx" | head -n1` == "lx" ]] ; then
																	PKG=`echo "lxde/${PKG}.lxde"`
																else
																	if [[ `echo "${PKG}" | grep -o "php" | head -n1` == "php" ]] ; then
																		PKG=`echo "php/${PKG}.php"`
																	else
																		if [[ `echo "${PKG}" | grep -o "alsa" | head -n1` == "alsa" ]] ; then
																			PKG=`echo "alsa/${PKG}.alsa"`
																		else
																			if [[ `echo "${PKG}" | grep -o "compiz" | head -n1` == "compiz" ]] ; then
																				PKG=`echo "compiz/${PKG}.compiz"`
																			else
																				if [[ `echo "${PKG}" | grep -o "dbus" | head -n1` == "dbugs" ]] ; then
																					PKG=`echo "dbus/${PKG}.dbus"`
																				else
																					if [[ `echo "${PKG}" | grep -o "gambas" | head -n1` == "gambas" ]] ; then
																						PKG=`echo "gambas/${PKG}.gambas"`
																					else
																						if [[ `echo "${PKG}" | grep -o "qt" | head -n1` == "qt" ]] ; then
																							PKG=`echo "qt/${PKG}.qt"`
																						else
																							if [[ `echo "${PKG}" | grep -o "firefox" | head -n1` == "firefox" ]] ; then
																								PKG=`echo "mozilla/${PKG}.mozilla"`
																							else
																								if [[ `echo "${PKG}" | grep -o "thunderbird" | head -n1` == "thunderbird" ]] ; then
																									PKG=`echo "mozilla/${PKG}.mozilla"`
																								else
																									if [[ `echo "${PKG}" | grep -o "seamonky" | head -n1` == "seamonky" ]] ; then
																										PKG=`echo "mozilla/${PKG}.mozilla"`
																									fi
																								fi
																							fi
																						fi
																					fi
																				fi
																			fi
																		fi
																	fi
																fi
															fi
														fi
													fi
												fi
											fi
										fi
									fi
								fi
							fi
						fi
					fi
				fi
			fi
		fi
	fi
# yes, the code above sucks

# write the important stuff into our logfile
	echo "${UDATE}|root|${STATE}|${PKG}" | grep "^[0-9]*|root|A|\|^[0-9]*|root|D|\|^[0-9]*|root|M|" >> ${WORKINGDIR}/pacman_gource.log

# here we print how log the script already runs and try to estimate how log it will run until finished
# but we only update this every 250 lines
	if [ "${LINEPERCOUT}" == "250" ] ; then
		LINEPERC=`calc -p "${LINE} / ${MAXLINES} *100" | sed -e 's/\~//'`
		LINEPERCOUT=`echo ${LINEPERC} | grep -o "[0-9]*\.\?[0-9]\?[0-9]" | head -n1`
		timeend
		TGDOUT=`echo ${TDG} | grep -o "[0-9]*\.\?[0-9]\?[0-9]" | head -n1`
		TIMEDONEONE=`calc -p "100 / ${LINEPERC} *${TDG}" | sed 's/\~//'`
		TIMEDONEFINAL=`calc -p "${TIMEDONEONE} - ${TDG}" | sed 's/\~//' | grep -o "[0-9]*\.\?[0-9]\?[0-9]" | head -n1`
		echo "Already ${LINEPERCOUT}% done after ${TGDOUT}s."
		echo -e "Done in approximately ${TIMEDONEFINAL}s.\n"
		LINEPERCOUT=0
	fi

# set switch to next line and re-start the loop
	LINE=`expr ${LINE} + 1`
	LINEPERCOUT=`expr ${LINEPERCOUT} + 1`

done





# time it took to run the script
TIMEFINAL=`echo "${TDG}" | grep -o "[0-9]*\.\?[0-9]\?[0-9]" | head -n1`

echo -e "100 % done after ${TIMEFINAL}s.\n"

echo "Output file is ./pacman_gource.log"

# this is how we can visualize the log
echo "If you have \"gource\" installed, run"
echo -e "\tgource ${WORKINGDIR}/pacman_gource${VERSION}.log -1200x720 -key --camera-mode overview --highlight-all-users -i 0 -a 0.001 -s 0.5 --hide progress,mouse --stop-at-end --max-files 99999999999 --max-file-lag 0.00001"
echo -e "to visualize the log using gource.\n"
echo "If you additionally want to make a video of the visualization and have the needed programs installed, append"
echo -e "\t--output-ppm-stream - | ffmpeg  -f image2pipe -vcodec ppm -i - -vcodec libtheora -y -b 100000K -r 30  -threads 2 pacmanlog2gource_`date +%b\_%d\_%Y`.ogv"
echo "to the first command."
echo "\"gource -H\" will give you more information on how to use gource."


mv ${WORKINGDIR}/pacman_tmp.log  ${WORKINGDIR}/pacman_now.log

rm ${WORKINGDIR}/pacman_purged.log ${WORKINGDIR}/proceed.log
