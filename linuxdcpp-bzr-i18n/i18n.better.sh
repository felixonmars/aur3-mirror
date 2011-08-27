#!/bin/bash

# This file is for testing purposes only. Functionality will be moved to scons script later.

cd "$(dirname $0)" || exit 1

LINUX_pot="linux/po/linuxdcpp.pot"
DCPP_pot="dcpp/po/libdcpp.pot"

if [ ! -f "$LINUX_pot" -o ! -f "$DCPP_pot" ]; then
	KEYWORDS="--keyword=_ \
		--keyword=F_ --keyword=S_:1 --keyword=C_:1 \
		--keyword=PF_:1c,2 --keyword=PS_:1c,2 --keyword=PC_:1c,2 \
		--keyword=NF_:1,2 --keyword=NS_:1,2 --keyword=NC_:1,2 \
		--keyword=gettext_noop --keyword=N_ --foreign-user --boost --add-comments=TRANSLATORS"
	ARGUMENTS="--from-code=UTF-8 --package-name=linuxdcpp \
		--msgid-bugs-address=https://translations.launchpad.net/linuxdcpp"
	DCPP="--no-wrap --keyword=CT_ --boost --sort-output"

	xgettext $ARGUMENTS --output="$LINUX_pot" --copyright-holder="LinuxDC++ team" --language glade glade/*.glade
	xgettext $ARGUMENTS --output="$LINUX_pot" $KEYWORDS --join-existing --copyright-holder="LinuxDC++ team" --language C++ linux/*.cc
#	xgettext $ARGUMENTS  $KEYWORDS $DCPP --join-existing --copyright-holder="LinuxDC++ team" --language C++ dcpp/*.cpp
	xgettext $ARGUMENTS --output="$DCPP_pot" $KEYWORDS $DCPP --copyright-holder="DC++ team" --language C++ dcpp/*.cpp

	for i in "$LINUX_pot" "$DCPP_pot"; do
		echo "--- suspicious looking strings in \"$i\":"
		grep '^msgid \(" .*\|.* "\)$' "$i" -C 1 \
			| sed 's,#: \(.*\),\1,' \
			| sed 's,\([^: ]*:[^: ]*\),\n\1:,g'
		echo "--- "
	done
fi

if [ ! -z "$1" -a ! -z "$2" ]; then
	#WINPO=~/c/dcplusplus/win32/po/sv.po # "sv.po" and "~/c/.."????????????
	WINPO="$2"
	if test -f linux/po/$1.po ; then
		msgmerge linux/po/$1.po linux/po/linuxdcpp.pot --update --backup none # \
		if test -f "$WINPO" ; then
# Replace & with _
# Replace && with &
# Remove \r
# Remove \t...
# and convert to linuxdcpp domain
# Concatenate with previous linuxdcpp translation, adding
# new msgids from upstream dcpp-win32 to linuxdcpp. Old msgids
# with translations for linuxdcpp are left intact
			mv linux/po/$1.po linux/po/$1.po.bak
			sed 's/\([^&]\)&\([^&]\)/\1_\2/' "$WINPO" \
				| sed 's/&&/&/' \
				| sed 's/\\t.*"$/"/' \
				| sed 's,\\r,,g' \
				| msguniq /dev/fd/0 -o /dev/fd/1 \
				| msgmerge /dev/fd/0 linux/po/linuxdcpp.pot -o /dev/fd/1 --previous \
				| msgcat linux/po/$1.po.bak /dev/fd/0 --use-first -o linux/po/$1.po
			echo "Updated $1 file with upstream dc++"
		fi
	else # what? if WINPO do not exist then "sed .. WINPO"?
		sed 's/\([^&]\)&\([^&]\)/\1_\2/' "$WINPO" \
			| sed 's/&&/&/' \
			| sed 's/\\t.*"$/"/' \
			| sed 's,\\r,,g' \
			| msguniq /dev/fd/0 -o /dev/fd/1 \
			| msgmerge /dev/fd/0 linux/po/linuxdcpp.pot -o linux/po/$1.po --previous
		echo "Created new $1 translation file"
	fi

	echo "--> libdcpp.pot merge with $1.po"
	msgmerge dcpp/po/$1.po dcpp/po/libdcpp.pot > dcpp/po/new.$1.po
	mv dcpp/po/new.$1.po dcpp/po/$1.po

	mkdir -p locale/$1/LC_MESSAGES
	msgfmt -c linux/po/$1.po -o locale/$1/LC_MESSAGES/linuxdcpp.mo
	msgfmt -c dcpp/po/$1.po -o locale/$1/LC_MESSAGES/libdcpp.mo # o'realy? :[

elif [ "${1:0:1}" = "-" ]; then
				echo "$(basename $0) [lang] <winpo \"path/file\" or \"none\">"
fi
