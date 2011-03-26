#!/bin/bash

XSLSRT="/usr/lib/youtube-srt/youtubesrt.xsl"
XSLLANG="/usr/lib/youtube-srt/youtubelang.xsl"

VERSION="0.2"

echo "Youtube-srt version $VERSION"
echo ""

if [[ "$1" =~ .*[\&?]v=([^&]*)(&.*|$) ]]; then
    VIDEO_ID=${BASH_REMATCH[1]}
else
    echo "Invalid url" >&2
    echo "Usage: ""$0"" youtube_url [ language ] [ outfile ]" 
    exit 1
fi

if [[ -n "$2" ]]; then
    LANG="$2"
else
    LANG="en"
fi

if [[ -n "$3" ]]; then
    OUTFILE="$3"
else
    OUTFILE="./$VIDEO_ID.srt"
fi

# Temporary URL to obtain the list of languages (since the param "name" is not known)
URL="http://video.google.com/timedtext?type=list&v=""$VIDEO_ID"

# lang_code name \n - separated list
LANGLIST=`wget -q "$URL" -O - | sed 's/\&amp;/\&/g' | xsltproc $XSLLANG -`
LANGLINE=`echo "$LANGLIST" | grep ^"$LANG"` 

if [[ -z "$LANGLINE" ]]; then
    echo -n "["
    echo -en "\E[48;31mFAIL"; tput sgr0
    echo "] The language you choose ($LANG) is not available for the video $VIDEO_ID"

    echo "The following languages are available:"
    echo `echo "$LANGLIST" | tr -d '\n'`
    exit 2
fi

NAME=`echo "$LANGLINE" | awk '{print $2}'`
URL="http://video.google.com/timedtext?type=track&name=$NAME&lang=""$LANG""&v=""$VIDEO_ID"

if [[ -e "$OUTFILE" ]]; then
    echo "The file $OUTFILE already exists, do you want to replace the existing file? [Y,n]"
    read -s -n 1 what
    echo 
    if [[ ("$what" == "n") || ("$what" == "N") ]]; then
        echo -n "["
        echo -en "\E[48;31mFAIL"; tput sgr0
        echo "] The file $OUTFILE could not be saved"
        exit 3
    fi
fi
    
wget -q "$URL" -O - | sed 's/\&amp;/\&/g' | xsltproc $XSLSRT - > "$OUTFILE"

echo -n "["
echo -en "\E[48;32mDONE"; tput sgr0
echo "] Youtube captions saved in $OUTFILE"

exit 0
