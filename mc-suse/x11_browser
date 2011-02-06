#!/bin/bash
#
# Call appropriate brower
#
# Copyright (c) 2001 Philipp Thomas <pthomas@suse.de>
#
# Borrowed heavily from url_handler.sh by Werner Fink <werner@suse.de>
#

url="$1"
method="${1%%:*}"

if test "$url" = "$method" ; then
    case "${url}" in
		*/*.htm|*/*.html) method=http	;;
		*/*.htmls)	  method=https	;;
		/*) if test -r "${url}" ; then
				  method=file
		    fi				;;
		*) if test -r "$PWD/${url}" ; then
				  method=file
				  url="$PWD/${url}" 
		    fi				;;
    esac

    case "$method" in
	file)		url="${method}:$url"	;;
	*)		url="${method}://$url"	;;
    esac
fi

shift

case "$method" in
    file|http|https)
	http=
	type -p lynx >& /dev/null && http=lynx
	type -p links >& /dev/null && http=links
	type -p w3m >& /dev/null && http=w3m
	test -n "$DISPLAY" && type -p netscape >& /dev/null && http=netscape
	test -n "$DISPLAY" && type -p Netscape >& /dev/null && http=Netscape
	test -n "$DISPLAY" && type -p opera >& /dev/null && http=opera
	test -n "$DISPLAY" && type -p mozilla >& /dev/null && http=mozilla
	case "$http" in
	    [nN]etscape|opera|mozilla) ($http -remote "openURL($url)" || $http "$url") >/dev/null 2>&1 & ;;
	    lynx|w3m|links)	 exec $http "$url" ;;
	    *)
		echo "No HTTP browser found."
		read -p "Press return to continue: "
		exit 0  # No error return
		;;
	esac
	;;
    *)
	echo "URL type \"$method\" not known"
	read -p "Press return to continue: "
	exit 0  # No error return
	;;
esac
