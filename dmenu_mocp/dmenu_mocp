#!/bin/sh
#thanks to dpm i just changed up the commands xD

ACTION=`printf "playlist\npause/play\nnext\nprevious\nstart\nexit\nopen\nload\nshuffle\nrepeat\n" | dmenu -i $*`

if [ "$ACTION" == 'playlist' ]; then
  mocp -p
fi

if [ "$ACTION" == 'pause/play' ]; then
  mocp -G
fi

if [ "$ACTION" == 'next' ]; then
 mocp -f  
fi

if [ "$ACTION" == 'previous' ]; then
  mocp -r
fi

if [ "$ACTION" == 'start' ]; then
 mocp -S
 dmenu_mocp
fi

if [ "$ACTION" == 'exit' ]; then
 mocp -x
fi

if [ "$ACTION" == 'open' ]; then 
 xterm -e mocp
fi

if [ "$ACTION" == 'load' ]; then
    mocp -c &&
  play=$(find ~/ -name *.m3u | dmenu -i $*)
  echo $play
  mocp -a "$play"
    mocp -p
fi
if [ "$ACTION" == 'shuffle' ]; then
 mocp -t shuffle
fi

if [ "$ACTION" == 'repeat' ]; then
  mocp -t repeat	
fi

