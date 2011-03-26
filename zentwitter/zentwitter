#!/bin/bash
## @author Michael Klier <chi@chimeric.de>
# @www http://www.chimeric.de/pojects/ZenTwitter
## Multi-user support by Isengrin L. Feuille <Autumnspeech@gmail.com>
# trivial twitter status update client

# main script
URL="https://twitter.com/statuses/update.xml"
ZENITY=/usr/bin/zenity
CURL=/usr/bin/curl
ZTRC=~/.zentwitterrc
SED=/bin/sed

if [ ! -f $ZTRC ] ;
then
	USER=$(${ZENITY} --entry --text="You haven't configured Zentwitter, enter your username" --title="ZenTwitter")	
	while [[ $(echo "${USER}" | tr -d ' ') == "" ]];
	do
		USER=$(${ZENITY} --entry --text="D'oh! You entered nothing! Write your username again or check if it's in ~/.zentwitterrc:" --title="ZenTwitter")
		if [[ "$?" == 1 ]];
		then
			exit 0
		fi
	done

	PASS=$(${ZENITY} --entry --text="Now enter your password" --title="ZenTwitter")
	while [[ $(echo "${PASS}" | tr -d ' ') == "" ]];
	do
		PASS=$(${ZENITY} --entry --text="D'oh! You entered nothing! Write your password again or check if it's in ~/.zentwitterrc:" --title="ZenTwitter")
		if [[ "$?" == 1 ]];
		then
			exit 0
		fi
	done
	echo $USER > $ZTRC
	echo $PASS >> $ZTRC
else
	USER=$(${SED} -n 1p $ZTRC)
	PASS=$(${SED} -n 2p $ZTRC)
fi

# check if zenity is installed
if [[ ! -x $ZENITY ]];
then
    echo "ERROR: Zenity is missing!"
    exit 1
fi
 
# check if curl is installed
if [[ ! -x $CURL ]];
then
    $ZENITY --error --text="ERROR: curl is missing" --title="ZenTwitter"
    exit 1
fi

# check if sed is installed
if [[ ! -x $SED ]];
then
$ZENITY --error --text="ERROR: sed is missing" --title="ZenTwitter"
exit 1
fi

# get tweet & update status
if [ $# != 0 ]; then
        export tweet="$*";
fi
 
if [ $# = 0 ]; then
        export tweet=$(${ZENITY} --entry --text="Gimme your tweet:" --title="ZenTwitter")
fi

while [[ $(echo "${tweet}" | tr -d ' ') == "" ]];
do
    tweet=$(${ZENITY} --entry --text="D'oh! You entered nothing! Try again or cancel:" --title="ZenTwitter")
    if [[ "$?" == 1 ]];
	    then
		        exit 0
		        fi
		done

export count=`echo "$tweet" | wc -m`;
 
if [ $count -gt 140 ]; then
        $ZENITY --error --text="Your status was over 140 characters." --title="ZenTwitter"
        exit;
fi
 
if [ -z "$tweet" ]; then
        $ZENITY --error --text="Your status wasn't changed." --title="ZenTwitter"
        exit;
else
        $CURL -u ${USER}:${PASS} -d status="${tweet}" -d source="ZenTwitter" -s ${URL}
fi

if [[ "$?" == 1 ]];
then
    exit 0
fi

if [[ "$?" == 0 ]];
then
#    $ZENITY --info --text="Updated successful!" --title="ZenTwitter"
    exit 0
else
    $ZENITY --error --text="Something went wrong!\nRun ZenTwitter from a commandline for more information!" --title="ZenTwitter"
    exit 1
fi
