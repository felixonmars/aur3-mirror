#!/bin/bash

# Program:	Popular Packages
# Purpose:	Lists popular packages not installed
#
# Author:	Copyright 2011 Xavion
#
# License:
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


# Constants
Author="Xavion"
Purpose="Lists popular packages not installed"
AppName="Popular Packages"
Version="0.1.0"
Details="${AppName} v${Version} by ${Author}"
Usage="Usage: `basename "$0"` [-d] [-m<minimum>]"
Pacman=`which pacman`
PSURL="https://www.archlinux.de/?page=PackageStatistics"

# Variables
ShowDesc=1
Minimum=30

# Arguments
for Argument; do
	case "${Argument}" in
	-d) ShowDesc=0;;
	-m*) Minimum=`echo "${Argument}" | awk -F '-m' '{print $2}'`;;
	*-h*) echo -e "${Details}\n${Purpose}"; echo -e "\n${Usage}"; exit;;
	*-v*) echo -e "${Details}"; exit;;
	esac
done

# Retrieve
echo -e "Retrieving the package statistics ..."
Stats="`wget -qO- ${PSURL} | grep -e '<tr><td style="width: 200px;">' -e '&nbsp;%'`"

# Retrieved
if [ "${Stats}" ]; then
	#echo -e "Packages with ~${Minimum}% or higher popularity will be shown."

	# Inits
	LineNum=1
	NumLines=`echo "${Stats}" | wc -l`
	Repository=""
	Popularity=100
	RepoActive=0
	Packages="`${Pacman} -Q 2> /dev/null`"

	echo "${Stats}" | while read StatLine; do

		# Progress
		let LineNum=${LineNum}+1
		
		# Repository
		if [ "`echo ${StatLine} | grep '<tr><th>'`" ]; then
			Repository=`echo ${StatLine} | awk -F '<tr><th>' '{print $2}' | awk -F '</th><td>' '{print $1}'`
			
			# Active
			if [ "`${Pacman} -Sl ${Repository} 2> /dev/null`" ]; then
				RepoActive=1
			else
				RepoActive=0
			fi
			
			Popularity=100

			echo -e "\n\nListing '${Repository}' repository packages ...\n"

			printf "%-15s%-15s%-30s%-s\n" "Progress" "Popularity" "Package" "Description"
			printf "%-15s%-15s%-30s%-s\n" "--------" "----------" "-------" "-----------"
		fi

		# Entry
		if [ ${Popularity} -ge ${Minimum} ] && [ "${Repository}" ]; then
			# Package
			if [ "`echo ${StatLine} | grep '<tr><td style="width: 200px;">'`" ]; then
				Package=`echo ${StatLine} | awk -F '<tr><td style="width: 200px;">' '{print $2}' | awk -F '</td><td><table style="width:100%;">' '{print $1}'`
			# Popularity
			elif [ "`echo ${StatLine} | grep '&nbsp;%'`" ]; then
				Popularity=`echo ${StatLine} | awk -F '.' '{print $1}'`
				PacLine=`echo "${Packages}" | grep "${Package} "`

				if [ ! "${PacLine}" ]; then
					let Progress=100*${LineNum}/${NumLines}

					# Description
					if [ ${ShowDesc} == 1 ] && [ ${RepoActive} == 1 ]; then
						Description=`${Pacman} -Si ${Package} 2> /dev/null | grep "Description" | awk -F ': ' '{print $2}'`
					else
						Description=""
					fi

					printf "%-15s%-15s%-30s%-s\n" "${Progress}%" "${Popularity}%" "${Package}" "${Description}"
				fi
			fi
		fi
	done
# Error
else
	echo -e "\nError: The package statistics couldn't be retrieved; check your network settings and try again." >&2
fi
