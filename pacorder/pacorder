#!/bin/sh
#~ script wrote by <xavi@netsons.org> and <ech0s7@netsons.org>
#~
#~ This program is free software: you can redistribute it and/or modify
#~ it under the terms of the GNU General Public License as published by
#~ the Free Software Foundation, either version 3 of the License, or
#~ (at your option) any later version.
#~ 
#~ This program is distributed in the hope that it will be useful,
#~ but WITHOUT ANY WARRANTY; without even the implied warranty of
#~ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#~ GNU General Public License for more details.
#~ 
#~ You should have received a copy of the GNU General Public License
#~ along with this program.  If not, see <http://www.gnu.org/licenses/>.

  case "$1" in
    ""|-h|--help)
              # help me!
              echo -e " pacorder, a script to sort all packages installed in your Arch Linux by\n required space.\n\n to use it (decreasing output in kilobytes), simply run: \n pacorder -DK [--dkb]\n decreasing output in megabytes: \n pacorder -DM [--dmb] \n\n to have increasing output (biggest packages the least) siply run:\n pacorder -IK [--ikb]\n or\n pacorder -IM [--imb] \n\n to display this help \n pacorder -h or --help\n"
              ;;
	-DM|--dmb) LANG=C pacman -Qi | sed -n '/^Name[^:]*: \(.*\)/{s//\1 /;x};/^Installed[^:]*: \(.*\)/{s//\1/;H;x;s/\n//;p}' | sort -rnk2 | awk '{$2=$2/1024; printf "%-30s %s MB\n", $1, $2}'
			  ;;
	-IM|--imb) LANG=C pacman -Qi | sed -n '/^Name[^:]*: \(.*\)/{s//\1 /;x};/^Installed[^:]*: \(.*\)/{s//\1/;H;x;s/\n//;p}' | sort -nk2 | awk '{$2=$2/1024; printf "%-30s %s MB\n", $1, $2}'
              ;;
	-DK|--dkb) LANG=C pacman -Qi | sed -n '/^Name[^:]*: \(.*\)/{s//\1 /;x};/^Installed[^:]*: \(.*\)/{s//\1/;H;x;s/\n//;p}' | sort -rnk2 | awk '{printf "%-30s %s KB\n", $1, $2}'
			  ;;
	-IK|--ikb) LANG=C pacman -Qi | sed -n '/^Name[^:]*: \(.*\)/{s//\1 /;x};/^Installed[^:]*: \(.*\)/{s//\1/;H;x;s/\n//;p}' | sort -nk2 | awk '{printf "%-30s %s KB\n", $1, $2}'
			  ;;
	*) echo -e " pacorder, a script to sort all packages installed in your Arch Linux by\n required space.\n\n to use it (decreasing output in kilobytes), simply run: \n pacorder -DK [--dkb]\n decreasing output in megabytes: \n pacorder -DM [--dmb] \n\n to have increasing output (biggest packages the least) siply run:\n pacorder -IK [--ikb]\n or\n pacorder -IM [--imb] \n\n to display this help \n pacorder -h or --help\n"
			  ;;
  esac
