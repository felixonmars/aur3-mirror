#!/bin/sh
#
#  Copyright 2007 Erlend Davidson <Erlend.Davidson@gmail.com>
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU Library General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
#
# ffmpeg-thumbnailer - thumbnailer script for PS files.
#
# Usage: ffmpeg-thumbnailer video-file png-file size
#

# command line parameters
ifile=$1
ofile=$2
size=$3

audiothumbnailer -i "${ifile}" -o "${ofile}" -s "${size}"
