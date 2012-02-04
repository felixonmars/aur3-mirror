#!/bin/sh

NOM=`wget -o /dev/null -O - "http://www.tv3.cat/su/tvc/tvcConditionalAccess.jsp?ID="$1"&QUALITY=H&FORMAT=MP4" |
grep media\ videoname= |
sed 's/.*videoname="//;s/".*//' |
iconv -f iso-8859-15 - |
sed 's#[?:\/*"<> ]#_#g;s#&quot;#_#g'`

echo ${NOM}

wget -o /dev/null -O - "http://www.tv3.cat/su/tvc/tvcConditionalAccess.jsp?ID="$1"&QUALITY=H&FORMAT=MP4" |
grep rtmp |
iconv -f iso-8859-15 - |
sed "s/.*rtmp/rtmp/;s/?.*//" |
xargs rtmpdump -r |
ffmpeg -i - -vcodec copy -acodec copy TV3-${NOM}.mp4

