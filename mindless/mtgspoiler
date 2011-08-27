#!/bin/bash

die()
{
	case "${1}" in
		"print-usage" )
			echo "Oracle Spoiler Manager (by) Caelyl <caelyl@gmail.com>
A script to manage Oracle card data spoilers for Magic: The Gathering.

Usage:  mtgspoiler < [ -? | --help ] | [ -d | --defaultdir ] | directory > ...
	[ -q ]

This script will download the current Oracle spoiler in full from the Gatherer
online database (http://ww2.wizards.com/gatherer/index.aspx) and format it as a
flatfile database for use with Mindless Automaton. The filename will be
generated of the form 'oracle-MMddYYYY.txt', and a symlink 'oracle.txt' will be
created.

Command-Line Options:

	-? | --help
		Show this usage information.

	-d | --defaultdir
		Use the default directory of '/usr/share/mindless'.

	[ directory ]
		The directory in which to place the spoiler and symlink.

	-q | --quiet
		Suppress the warning about an invalid or missing directory.

The default spoiler directory is used if [ directory ] is either not specified
or is invalid." | less
			;;
		"nomakedir" )
			echo "Could not create directory '${_directory}'. Aborting."
			;;
		"root" )
			echo "This script is designed to run as a non-root user. Users must be in the 'games'
group in order to use this script without specifying an alternate starting
directory. (see 'mtgspoiler -?' for help on how to use the script)"
			;;
	esac
	exit
}

createdir()
{
	mkdir -p "${_directory}" || die nomakedir
}

warning()
{
	case "${1}" in
		"nodir" )
			if [[ "${_quiet}" = 0 ]]; then
				echo "Warning: No directory specified, defaulting to '/usr/share/mindless'."
			fi
			;;
		"invalid" )
			echo "Warning: Invalid directory specified. Create it (else default to
'/usr/share/mindless')? [y/n]"
			if [[ "${_quiet}" = 0 ]]; then
				read _reply
			else
				${_reply}="y"
			fi
			if [[ "${_reply}" = "y" ]]; then
				createdir
			fi
			;;
		"definvalid" )
			if [[ "${_quiet}" = 0 ]]; then
				echo "Warning: Default directory ('/usr/share/mindless') does not exist.
Creating it..."
			fi
			createdir
			;;
	esac
}

fetch_spoiler()
{
	if [[ "${_username}" = "root" ]]; then
		die root
	fi
	wget -O "${_spoiler}" "${_livespoiler}"
	sed -n -i -e '/xmp/,/xmp/p' "${_spoiler}"
	sed -i -e '/xmp/d' "${_spoiler}"
	ln -sf "${_spoiler}" "${_spoilerlink}"
	chown :games "${_spoiler}" "${_spoilerlink}"
	chmod a=r,ug+w "${_spoiler}"
}

test_fetch()
{
echo	wget -O "${_spoiler}" "${_livespoiler}"
echo	sed -n -i -e '/xmp/,/xmp/p' "${_spoiler}"
echo	sed -i -e '/xmp/d' "${_spoiler}"
echo	ln -sf "${_spoiler}" "${_spoilerlink}"
echo	chown :games "${_spoiler}"
echo	chmod a=r,ug+w "${_spoiler}"
}

_username=`id -nu`
_debug=0
_quiet=0
_warntype=
_directory=

for _argument in ${*}; do
	case "${_argument}" in
		"--debug" )
			_debug=1
			;;
		"-?" | "--help" )
			die "print-usage"
			;;
		"-d" | "--defaultdir" )
			_directory=/usr/share/mindless
			;;
		"-q" | "--quiet" )
			_quiet=1
			;;
		* )
			_directory="${_argument}"
			;;
	esac
done

if [[ -z "${_directory}" ]]; then
	_warntype=nodir
elif [[ ! -d "${_directory}" ]]; then
	_warntype=invalid
fi
if [[ ! -z "${_warntype}" ]]; then
	warning ${_warntype}
fi
_warntype=
if [[ ! -d "${_directory}" ]] || [[ -z "${_directory}" ]]; then
	_directory=/usr/share/mindless
fi
if [[ ! -d "${_directory}" ]]; then
	_warntype=definvalid
fi
if [[ ! -z "${_warntype}" ]]; then
	warning ${_warntype}
fi
_warntype=

if [[ ${_directory: -1} = "/" ]]; then
	_safedirectory=${_directory:0:${#_directory}-1}
else
	_safedirectory=${_directory}
fi
_spoiler=${_safedirectory%/}/oracle-`date +%m%e%Y`.txt
_spoilerlink=${_safedirectory%/}/oracle.txt
_livespoiler="http://ww2.wizards.com/gatherer/index.aspx?term=%20&Field_Name=on&Field_Rules=on&Field_Type=on&setfilter=All%20sets&output=Oracle%20Spoiler"

if [[ "${_debug}" = 0 ]]; then
	fetch_spoiler
else
	test_fetch
fi
