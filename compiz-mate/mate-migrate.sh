#!/bin/bash
# Copyright © 2011 Perberos
#
# This program is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the
# Free Software Foundation; either version 3 of the License, or (at your
# option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
# either provide a command line option otherwise src folder will be considered.
if [ $# -gt 0 ]
then
  pkgdir=$1 # the folder where is the code, be carefull
else
  pkgdir=src
fi
#support for space in filename
IFS=$'\n'
replaces=(
	'gnome' 'mate'
	'GNOME' 'MATE'
	'Gnome' 'Mate'
	'Metacity' 'Marco'
	'metacity' 'marco'
	'METACITY' 'MARCO'
	'G_CONST_RETURN' 'const'
)

#
# rename files and folders
#
dirs=$(find "$pkgdir/" -type d -not -iwholename '*.git*' | sed "s|^${pkgdir}/||")
# for revert the order of folders, so the rename is safe
revertdirs=

for dirsname in ${dirs}; do
	revertdirs="$dirsname $revertdirs"
done

# directory mv
for dirsname in ${revertdirs}; do
	oldname=`basename $dirsname`
	newname=$oldname

	for index in $(seq 0 2 $((${#replaces[@]} - 1))); do
		newname=${newname/${replaces[$index]}/${replaces[$index + 1]}}
	done

	if [ $oldname != $newname ]; then
		echo "renaming folder $oldname to $newname"

		path=`dirname "$pkgdir/$dirsname"`

		retval=`mv "$path/$oldname" "$path/$newname"`
	fi
done

#
# rename files
#
files=$(find "$pkgdir/" -type f -not -iwholename '*.git*' | sed "s|^${pkgdir}/||")
# files mv
for filename in ${files}; do
	oldname=`basename $filename`
	newname=$oldname

	for index in $(seq 0 2 $((${#replaces[@]} - 1))); do
		newname=${newname/${replaces[$index]}/${replaces[$index + 1]}}
	done

	if [ $oldname != $newname ]; then
		echo "renaming file $oldname to $newname"

		path=`dirname "$pkgdir/$filename"`

		retval=`mv "$path/$oldname" "$path/$newname"`
	fi
done

#
# rename file contents
#
files=$(find "$pkgdir/" -type f -not \( -iwholename '*.git*' -o -name "ChangeLog*" -o -name NEWS \) | sed "s|^${pkgdir}/||")

declare -a pid

for filename in ${files}; do
	{
		echo "Processing $filename..."
		for index in $(seq 0 2 $((${#replaces[@]} - 1))); do
			sed -i "s/${replaces[$index]}/${replaces[$index + 1]}/g" "$pkgdir/$filename"
			# datacontent=${datacontent/${replaces[$index]}/${replaces[$index + 1]}}
		done
		echo "...done $filename"
	} &
	pid=(${pid[@]} $!)
done

wait ${pid[@]}

echo "done."
