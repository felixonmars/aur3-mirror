#!/bin/bash


#    gitdiffbinstat - gets a git diff --shortstat-like output for changed binary files
#    Copyright (C) 2012  Matthias Krüger

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

# in order to avoid conflicts when starting the script twice, get unix time + nanoseconds and
# append them to the diffstat file

timestamp=`date +%s%N`

obj=$1
diffstat=/tmp/gitdiffstat.${timestamp}

# If no argument is given, print this how-to.
if [ -z "${obj}" ] ; then
	echo "Usage: \"gitdiffbinstat [<commit/branch/tag>]\""
	echo "Make sure to be in a git repo!"
	exit 1
fi

# Check if we are actually in a git repo

gitcheck=`git tag |& awk 'match($0,/fatal:\ Not\ a\ git\ repository\ /) {print substr($0,RSTART,RLENGTH)}'`
if [ "${gitcheck}" ] ; then
	echo "fatal: Not a git repository!"
	echo "Make sure to be in a git repo!"
	exit 1
fi

# get currend branch
curbranch=`git branch  | awk '/^\*\ /' | sed -e 's/\*\ //'`
# get current rev hash
curcommit=`git rev-parse HEAD`
# print what we compare in   git diff
echo " ${obj} -> ${curbranch}"
echo " ${obj} -> ${curcommit}"


# get the actuall diff we are going to process
git diff ${obj} --stat ./ | awk '/>/' > ${diffstat}


# generate our own  git diff --shortstat
gst=`git diff ${obj} --shortstat ./`
gstins=`echo ${gst} | awk '{print $4}'`
gstdels=`echo ${gst} | awk '{print $6}'`
gstchval=`expr ${gstins} - ${gstdels}`
gstchfiles=`echo ${gst} | awk '{print $1}'`

if [ "${gstchfiles}" == 1 ] ; then
	gstfiles=file
else
	gstfiles=files
fi
# say file/files correctly if we have only 0, one or several files
if [ "${gstchval}" -gt 0 ] ; then
	echo -e " ${gstchfiles} ${gstfiles} changed, \e[033;32m${gstins} \e[0minsertions(\e[033;32m+\e[0m), \e[033;31m${gstdels}\e[0m deletions(\e[033;31m-\e[0m) (\e[033;32m+${gstchval} lines\e[0m)"
else
	echo -e " ${gstchfiles} ${gstfiles} changed, \e[033;32m${gstins} \e[0minsertions(\e[033;32m+\e[0m), \e[033;31m${gstdels}\e[0m deletions(\e[033;31m-\e[0m) (\e[033;31m${gstchval} lines\e[0m)"
fi

# If there are no changes, exit
checksum=`cat ${diffstat} | wc -l`
if [ ${checksum} == 0 ] ; then
	echo " No binary files changed, exiting..."
	rm ${diffstat}
	exit 1
fi



# size (b) of all bin files of obj
old=`awk '{ sum+=$4} END {print sum}' ${diffstat}`
# size (b) of all bin files of curbranch/curcommit
new=`awk '{ sum+=$6} END {print sum}' ${diffstat}`
# amount of changed files
files=`wc -l ${diffstat} | awk '{print $1}'`




# "Bin 0 -> x bytes" :  file has been added
newfiles=`awk '/Bin\ 0/' ${diffstat} | wc -l`
# "Bin x -> 0 bytes" : file has been deleted
delfiles=`awk '/->\ 0\ bytes/' ${diffstat} | wc -l`
# all files - new files - deleted files  = modified files
binchval=`expr ${newfiles} - ${delfiles}`
chfiles=`expr ${files} - ${binchval}`

if [ "${binchval}" -gt 0 ] ; then
	echo -e " Binary files: ${chfiles} modified, \e[033;32m${newfiles}\e[0m added, \e[033;31m${delfiles}\e[0m deleted. (\e[033;32m+${binchval} files\e[0m)"
else
	echo -e " Binary files: ${chfiles} modified, \e[033;32m${newfiles}\e[0m added, \e[033;31m${delfiles}\e[0m deleted. (\e[033;31m${binchval} files\e[0m)"
fi


# find out how many bytes bigger/smaller the repo got
changeval=`calc -p "${new}-${old}"`
# print the result in different colors :)

# say file/files correctly if we have only 0, one or several files
if [ "${files}" == 1 ] ; then
	somefiles=file
else
	somefiles=files
fi

if [ "${changeval}" -gt 0 ] ; then
	echo -e " ${files} binary ${somefiles} changed, \e[033;31m${old} bytes\e[0m -> \e[033;32m${new} bytes\e[0m (\e[033;32m+${changeval} bytes\e[0m)"
	else
	changeval1=`echo "${changeval}" | sed s/-//`
	echo -e " ${files} binary ${somefiles} changed, \e[033;31m${old} bytes\e[0m -> \e[033;32m${new} bytes\e[0m (\e[033;31m-${changeval1} bytes\e[0m)"
fi

# rather ugly foo to get nicer output numbers
newunit=b
newval=${new}
((newkilo=${new}/1024))
if [ ! "${newkilo}" == 0 ] ; then
	newunit=kb
	newval=${newkilo}
	((newmega=${newkilo}/1024))
	if [ ! "${newmega}" == 0 ] ; then
		newunit=Mb
		newval=${newmega}
		((newgiga=${newmega}/1024))
		if [ ! "${newgiga}" == 0 ] ; then
			newunit=Gb
			newval=${newgiga}
		fi
	fi
fi


oldunit=b
oldval=${old}
((oldkilo=${old}/1024))
if [ ! "${oldkilo}" == 0 ] ; then
	oldunit=kb
	oldval=${oldkilo}
	((oldmega=${oldkilo}/1024))
	if [ ! "${oldmega}" == 0 ] ; then
		oldunit=Mb
		oldval=${oldmega}
		((oldgiga=${oldmega}/1024))
		if [ ! "${oldgiga}" == 0 ] ; then
			oldunit=Gb
			oldval=${oldgiga}
		fi
	fi
fi


if [ "${changeval}" -gt 0 ] ; then
	changevalunit=b
	changevalval=${changeval}
	((changevalkilo=${changeval}/1024))
	if [ ! "${changevalkilo}" == 0 ] ; then
		changevalunit=kb
		changevalval=${changevalkilo}
		((changevalmega=${changevalkilo}/1024))
		if [ ! "${changevalmega}" == 0 ] ; then
			changevalunit=Mb
			changevalval=${changevalmega}
			((changevalgiga=${changevalmega}/1024))
			if [ ! "${changevalgiga}" == 0 ] ; then
				changedvalunit=Gb
				changevalval=${changvalgiga}
			fi
		fi
	fi
	echo -e " ${files} binary ${somefiles} changed, \e[033;31m${oldval}${oldunit}\e[0m -> \e[033;32m${newval}${newunit}\e[0m (\e[033;32m+${changevalval}${changevalunit}\e[0m)"

else
	changeval=`echo "${changeval}" | sed s/-//`
	changevalunit=b
	changevalval=${changeval}
	((changevalkilo=${changeval}/1024))
	if [ ! "${changevalkilo}" == 0 ] ; then
		changevalunit=kb
		changevalval=${changevalkilo}
		((changevalmega=${changevalkilo}/1024))
		if [ ! "${changevalmega}" == 0 ] ; then
			changevalunit=Mb
			changevalval=${changevalmega}
			((changevalgiga=${changevalmega}/1024))
			if [ ! "${changevalgiga}" == 0 ] ; then
				changedvalunit=Gb
				changevalval=${changvalgiga}
			fi
		fi
	fi
	echo -e " ${files} binary ${somefiles} changed, \e[033;31m${oldval} ${oldunit}\e[0m -> \e[033;32m${newval} ${newunit}\e[0m (\e[033;31m-${changevalval} ${changevalunit}\e[0m)"

fi
# remove the diffstat, we don't need it anymore
rm ${diffstat}
