#!/bin/bash
cd /usr/share/runescape-client-bin

usage() {
    cat <<EOF 

USAGE:
       $(basename $0) [wanted locale]

Without argument - your current locale is used.

EOF
       exit 1
}

if [ $# -eq 0 ]
then
    locale="${LANG:-en}"
else
    if [ $# -eq 1 ]
    then
	[ "$1" = "-h" ] && usage
	[ "$1" = "--help" ] && usage
	locale="$1"
    else
	usage
    fi
fi
locale="${locale%%_*}"

lang=0
[ "$locale" = "de" ] && lang=1
[ "$locale" = "fr" ] && lang=2
[ "$locale" = "pt" ] && lang=3

CP="/usr/share/runescape-client-bin/jagexappletviewer.jar"
"$JAVA_HOME"/bin/java -cp $CP \
    -Dcom.jagex.config=http://www.runescape.com/k=3/l=$lang/jav_config.ws \
    jagexappletviewer pixmaps
