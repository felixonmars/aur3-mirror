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

if [ -z "$1" ] ; then
	echo "Usage: \"gitdiffbinstat [<commit/branch>]\""
	echo "Make sure to be in a git repo!"
	exit 1
fi

gitcheck=`git tag |& grep -o "fatal:\ Not\ a\ git\ repository\ "`
if [ "$gitcheck" ] ; then
	echo "fatal: Not a git repository!"
	echo "Make sure to be in a git repo!"
	exit 1
fi

obj=$1

curbranch=`git branch  | grep "\*" | sed s/\*\ //`
curcommit=` git log -1 | grep commit | sed s/commit\ //`
echo " $obj -> $curbranch"
echo " $obj -> $curcommit"
git diff $obj --shortstat ./
diffstat=/tmp/gitdiffstat.tmp
git diff $obj --stat ./ | awk '/>/' > $diffstat

old=`awk '{ sum+=$4} END {print sum}' $diffstat`

new=`awk '{ sum+=$6} END {print sum}' $diffstat`

files=`wc -l $diffstat | awk '{print $1}'`


if [ $files = 0 ] ; then
	echo -e " 0 binary files changed"
else
	newfiles=`awk '/Bin\ 0/' $diffstat | wc -l`
	delfiles=`awk '/->\ 0\ bytes/' $diffstat | wc -l`
	chfiles=`expr $files - $newfiles - $delfiles`
	echo -e " Binary files: $chfiles modified, \e[033;32m$newfiles\e[0m added, \e[033;31m$delfiles\e[0m deleted."


	changeval=`calc -p "$new-$old"`

	if [ "$changeval" -gt 0 ] ; then
		echo -e " $files binary files changed, \e[033;31m$old bytes\e[0m -> \e[033;32m$new bytes\e[0m (\e[033;32m+$changeval bytes\e[0m)"
		else
		changeval1=`echo "$changeval" | sed s/-//`
		echo -e " $files binary files changed, \e[033;31m$old bytes\e[0m -> \e[033;32m$new bytes\e[0m (\e[033;31m-$changeval1 bytes\e[0m)"
	fi


	newunit=b
	newval=$new
	((newkilo=$new/1024))
	if [ ! "$newkilo" == 0 ] ; then
		newunit=kb
		newval=$newkilo
		((newmega=$newkilo/1024))
		if [ ! "$newmega" == 0 ] ; then
			newunit=Mb
			newval=$newmega
			((newgiga=$newmega/1024))
			if [ ! "$newgiga" == 0 ] ; then
				newunit=Gb
				newval=$newgiga
			fi
		fi
	fi


	oldunit=b
	oldval=$old
	((oldkilo=$old/1024))
	if [ ! "$oldkilo" == 0 ] ; then
		oldunit=kb
		oldval=$oldkilo
		((oldmega=$oldkilo/1024))
		if [ ! "$oldmega" == 0 ] ; then
			oldunit=Mb
			oldval=$oldmega
			((oldgiga=$oldmega/1024))
			if [ ! "$oldgiga" == 0 ] ; then
				oldunit=Gb
				oldval=$oldgiga
			fi
		fi
	fi


	if [ "$changeval" -gt 0 ] ; then
		changevalunit=b
		changevalval=$changeval
		((changevalkilo=$changeval/1024))
		if [ ! "$changevalkilo" == 0 ] ; then
			changevalunit=kb
			changevalval=$changevalkilo
			((changevalmega=$changevalkilo/1024))
			if [ ! "$changevalmega" == 0 ] ; then
				changevalunit=Mb
				changevalval=$changevalmega
				((changevalgiga=$changevalmega/1024))
				if [ ! "$changevalgiga" == 0 ] ; then
					changedvalunit=Gb
					changevalval=$changvalgiga
				fi
			fi
		fi
		echo -e " $files binary files changed, \e[033;31m$oldval $oldunit\e[0m -> \e[033;32m$newval$newunit\e[0m (\e[033;32m+$changevalval$changevalunit\e[0m)"

	else
		changeval=`echo "$changeval" | sed s/-//`
		changevalunit=b
		changevalval=$changeval
		((changevalkilo=$changeval/1024))
		if [ ! "$changevalkilo" == 0 ] ; then
			changevalunit=kb
			changevalval=$changevalkilo
			((changevalmega=$changevalkilo/1024))
			if [ ! "$changevalmega" == 0 ] ; then
				changevalunit=Mb
				changevalval=$changevalmega
				((changevalgiga=$changevalmega/1024))
				if [ ! "$changevalgiga" == 0 ] ; then
					changedvalunit=Gb
					changevalval=$changvalgiga
				fi
			fi
		fi
		echo -e " $files binary files changed, \e[033;31m$oldval $oldunit\e[0m -> \e[033;32m$newval $newunit\e[0m (\e[033;31m-$changevalval $changevalunit\e[0m)"

	fi
fi

rm $diffstat
