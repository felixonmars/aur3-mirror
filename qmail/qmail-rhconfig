#!/bin/bash
#
# This file sets up the qmail config files on a RedHat system using
# default values gleaned from the system itself.  This script is
# intended to replace the "config" script included with qmail itself.
#

set -e
cd ${1:-/var/qmail/control}
makefile() {
	file="$1"
	shift
	if ! [ -e "$file" -a -s "$file" ]; then
		tr A-Z a-z >"$file"
		chmod 644 "$file"
	else
		cat > /dev/null
	fi
}

hostname=`/bin/hostname -f`
domainname=`/bin/domainname -d`

echo $hostname | makefile me
echo $domainname | makefile defaultdomain 
echo $domainname | makefile defaulthost

(
  echo localhost
  echo $hostname
  ipmeprint | (
    while read ip; do
      if str=`ipcalc --hostname $ip 2>/dev/null`; then
        eval $str
        echo $HOSTNAME
      fi
    done
  )
) | sort -u | makefile locals

cat locals | makefile rcpthosts
