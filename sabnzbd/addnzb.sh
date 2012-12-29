#!/bin/sh

. /etc/conf.d/sabnzbd # import variables

urlencode() {
  local string="${1}"
  local strlen=${#string}
  local encoded=""

  for (( pos=0 ; pos<strlen ; pos++ )); do
     c=${string:$pos:1}
     case "$c" in
        [-_.~a-zA-Z0-9] ) o="${c}" ;;
        * )               printf -v o '%%%02x' "'$c"
     esac
     encoded+="${o}"
  done
 
  echo "${encoded}"
}

# copy file to directory where sabnzbd has read rights
TEMP_NZB="/var/tmp/"$(basename "$1")
cp "$1" "$TEMP_NZB"

curl -s "$URL/sabnzbd/api?mode=addlocalfile&apikey=$API_KEY&name=$(urlencode "$TEMP_NZB")" > /dev/null

rm "$TEMP_NZB"
