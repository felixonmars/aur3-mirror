#!/bin/sh

usage="Usage: $0 google_email google_password [ -e email ] [ -n name ] [ -p phone ] [ -g gender ] [ -b birthday ]"

[ "$#" = "0" ] && echo "$usage" && exit 1

xml=""

email="$1"
password="$2"

shift 2

while getopts 'e:n:p:g:b:' opt
do
	case "$opt" in
		e)
			[ -z "$OPTARG" ] && continue
			xml="$xml<gd:email rel='http://schemas.google.com/g/2005#other' address='$OPTARG' />"
		;;

		n)
			[ -z "$OPTARG" ] && continue
			name="$OPTARG"
			xml="$xml<gd:name><gd:fullName>$OPTARG</gd:fullName></gd:name>"
		;;

		p)
			[ -z "$OPTARG" ] && continue
			xml="$xml<gd:phoneNumber rel='http://schemas.google.com/g/2005#other'>$OPTARG</gd:phoneNumber>"
		;;

		g)
			[ -z "$OPTARG" ] && continue
			xml="$xml<gContact:gender value='$(echo $OPTARG | tr '[:upper:]' '[:lower:]')'/>"
		;;

		b)
			[ -z "$OPTARG" ] && continue
			xml="$xml<gContact:birthday when='$(date -d "$OPTARG" '+%F')'/>"
		;;

		?)
			echo "Invalid option: -$OPTARG"
			echo "$usage"
			exit 1
		;;
	esac
done

echo "Adding $name..."

curl -s -H "Content-Type: application/atom+xml" -H "GData-Version: 3.0" -d "<atom:entry xmlns:atom='http://www.w3.org/2005/Atom' xmlns:gd='http://schemas.google.com/g/2005' xmlns:gContact='http://schemas.google.com/contact/2008'>$xml</atom:entry>" -H "Authorization: GoogleLogin auth=$(curl -s https://www.google.com/accounts/ClientLogin -d Email=$email -d Passwd=$password -d service=cp | grep Auth | sed 's/Auth=\(.*\)/\1/')" "http://www.google.com/m8/feeds/contacts/default/full" > /dev/null
