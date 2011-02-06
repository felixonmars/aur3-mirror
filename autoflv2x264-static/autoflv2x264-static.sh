#!/bin/bash

# define the auto and video bitrates here
#####
abr=64
vbr=450
#####

# make a list of all flv files for transcoding
for files in $(find -maxdepth 1 -name '*.flv' | sed s'/.\///')
do
# convert to x264 using these bitrates and fix the filename
 mencoder "${files}" -oac mp3lame -lameopts vbr=3:br=${abr} -ovc x264 -x264encopts trellis=2:threads=auto:bitrate=${vbr} -vf hqdn3d -o "${files}.avi"
 newname=`echo ${files} | sed s'/.flv/.avi/'`
 mv ${files}.avi ${newname}
done
