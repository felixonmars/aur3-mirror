#!/bin/sh
#
#  Author: Erdem Cakir <1988er@gmail.com>
#    Date: September 13, 2009
#
# Purpose: Download and convert YouTube Videos
#

DESTDIR="YouTube-Zenity" # Destination directory located in ~
BITRATE="192" # MP3 quality in kbit/s

# DO NOT EDIT BELOW THIS LINE!

ZENITY="/usr/bin/zenity"
YOUTUBE="/usr/bin/youtube-dl"
FFMPEG="/usr/bin/ffmpeg"

wTITLE="YouTube-Zenity"
wICON="/usr/share/pixmaps/youtube-zenity.svg"

if [ ! -f "$ZENITY" ]; then echo "ERROR: I need Zenity! [ $ZENITY ]"; exit; fi

if ! [ -f "$YOUTUBE" -a -f "$FFMPEG" ]; then
    $ZENITY --error \
        --text="
<b>Missing dependencies:</b>

<big>/usr/bin/youtube-dl
/usr/bin/ffmpeg</big>" \
        --window-icon="$wICON"        
    exit
fi

DESTDIR="$HOME/$DESTDIR"
if [ ! -d "$DESTDIR" ]; then mkdir -p "$DESTDIR"; fi
cd "$DESTDIR"

checkURL=0
while [ "$checkURL" = 0 ]; do
    URL="$($ZENITY --entry \
    --title="$wTITLE" \
    --text="${TEXT:="Paste YouTube URL:"}" \
    --window-icon="$wICON" \
    --width=300)"    
	    
    if [ "$?" = 0 ]; then
        REGEX='http://(www\.)?youtube\.com/watch\?v=[[:alnum:]_-]{11}(&*)'
        if [[ "$URL" =~ $REGEX ]]; then checkURL=1; fi        
        if [ "$checkURL" = 0 ]; then TEXT="Incorrect URL! Try again:"; fi
	else exit
    fi
done

if [ "$checkURL" = 1 ]; then
    yTITLE="$($YOUTUBE -e $URL)"
    yTITLE="${yTITLE//+/ }"  

    TITLE="$($ZENITY --entry \
    --title="$wTITLE" \
    --text="${TEXT="Title (Filename):"}" \
    --entry-text="$yTITLE" \
    --window-icon="$wICON" \
    --width=300)"
	
    if [ "$?" = 0 ]; then
        TITLE=${TITLE:="$yTITLE"}
        TITLE="${TITLE////%}"
    else exit
    fi

    $($ZENITY --question \
    --text="\nExtract audio to MP3?" \
    --window-icon="$wICON")
    keepAUDIO=$?
    
    if [ "$keepAUDIO" = 0 ]; then
        $($ZENITY --question \
        --text="\nKeep video as MP4?" \
        --window-icon="$wICON")
	keepVIDEO=$?
    else keepVIDEO=0
    fi

    vKEY="${URL##*\?v=}"
    vKEY="${vKEY:0:11}"

    VIDEO="$vKEY.mp4"
    AUDIO="$TITLE.mp3"

    $YOUTUBE -bc http://youtube.com/watch?v=$vKEY &
    pidYOUTUBE="$!"
    
    trap "kill $pidYOUTUBE" INT TERM EXIT

    if [ -f "$AUDIO" ]; then AUDIO="$TITLE-$(date +%s).mp3"; fi

    (
        while [ -d "/proc/$pidYOUTUBE" ]; do echo 1; sleep 1; done
        
        trap - INT TERM EXIT

        if [ "$keepAUDIO" = 0 ]; then             
            echo "#$TITLE\n> Converting to MP3 [ "$BITRATE"kbit/s ] ..."
            
            $FFMPEG -v 5 -y -i "$VIDEO" -acodec libmp3lame -ac 2 -ab "$BITRATE"k "$AUDIO" &
            pidFFMPEG=$!
            
            trap "kill $pidFFMPEG" INT TERM EXIT

            while [ -d "/proc/$pidFFMPEG" ]; do echo 1; sleep 1; done
            
            trap - INT TERM EXIT
        fi
        
        if [ "$keepVIDEO" != 0 ]; then rm "$VIDEO"
	else
	    if [ -f "$TITLE.mp4" ]
	    then mv "$VIDEO" "$TITLE-$(date +%s).mp4"
	    else mv "$VIDEO" "$TITLE.mp4"
	    fi
        fi

        echo "#$TITLE\n> Download complete!"
    ) |
    $ZENITY --progress \
    --title="$wTITLE" \
    --text="$TITLE\n> Downloading video ..." \
    --window-icon="$wICON" \
    --width=300 \
    --percentage=0 \
    --pulsate

    if [ "$?" = 1 ]; then
        if [ -f "$VIDEO" ]; then rm "$VIDEO"; fi
        if [ -f "$AUDIO" ]; then rm "$AUDIO"; fi            
        exit
    fi
fi
