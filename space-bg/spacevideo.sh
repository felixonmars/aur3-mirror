#!/bin/bash
url=$1
cd ~/.spaceimgs
if [ `echo "$url" | grep 'www.youtube.com' | wc -l` -gt 0 ]; then
	url=`echo "$url" | awk -F '/embed/' '{ print $2; }'`
	youtube-dl http://www.youtube.com/watch?v=$url > /dev/null 2>&1
elif [ `echo "$url" | grep 'player.vimeo.com' | wc -l` -gt 0 ]; then
	vimeo-dl "$url" > /dev/null 2>&1
else
	echo "error $0: $url is not an expected format" 1>&2
	exit 1
fi
# how can i determine the file extension?
rm today.mp4
mv *.mp4 today.mp4 > /dev/null 2>&1
mv *.flv today.mp4 > /dev/null 2>&1
touch today.mp4
mplayer -vo jpeg -frames 1 -ss 5 today.mp4 > /dev/null 2>&1
mv *1.jpg today.jpg
#
