#!/bin/bash

# Program: Pac-Wrap
# Purpose: Wraps the 'pacman' and 'packer' tools
#
# Author: Copyright 2011 Bruenig, Xavion
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
Author="Bruenig, Xavion"
AppName="Pac-Wrap"
Version="0.2.2"
Purpose="Wraps the 'pacman' and 'packer' tools"
Details="${AppName} v${Version} by ${Author}"
Filename="`basename "$0"`"
Usage="Usage:
\t${Filename} <operation> [...]\n
Examples:
\t${Filename} -Ss python
\t${Filename} -R sunbird"

# Variables
Packer=`which packer 2> /dev/null`
Pacman=`which pacman-color 2> /dev/null`
if [ ! "${Pacman}" ]; then
	Pacman=`which pacman 2> /dev/null`
fi

# Arguments
if [ ! "$1" ]; then exit; fi
for Argument; do
	if [[ "${Argument}" =~ -.?h.* ]]; then echo -e "${Details}\n${Purpose}"; echo -e "\n${Usage}" >&2; exit; fi
	if [[ "${Argument}" =~ -.?v.* ]]; then echo -e "${Details}" >&2; exit; fi
done

# Try packer
${Packer} "$@"
#${Packer} "$@" | grep -v 'is not valid'

# Try pacman
[[ $? -eq 5 ]] && ${Pacman} "$@"
#[[ $? -eq 1 ]] && ${Pacman} "$@"
