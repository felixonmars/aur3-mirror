#!/bin/bash

 ########################################################
# TinyPicUploader (tpu) 0.2                                                            #
# Author:	       Arm the Homeless <ratm@archlinux.us> #
# Description:   Uploads to TinyPic. Read name. =P         #
# Syntax:		tpu [FILE]                                                              #
 ########################################################

if [ $# -eq 0 ]; then
echo "TinyPicUploader
Usage: tpu file [file, ...]

Uploads files to TinyPic and prints the result urls.
If directories are given they will be recursed for images.
"
exit 1
fi

function upload {
	if [ -d $1 ]; then
		echo "-- $1 --"
		for each in $(ls -d $1/*); do upload $each; done
	elif [ -f $1 ] && [ -r $1 ] && [ $(file -L -b --mime-type $1 | grep 'image') ]; then
		timestamp=$(date +'%s%N')
		workfile="/tmp/tinypic.$timestamp"
		curl -L -s -F "the_file=@$1" -F file_type=image -F action=upload "http://s4.tinypic.com/upload.php" -H "Expect:" -o $workfile
		uploaded=$(grep 'name="pic"' $workfile | sed 's/.*value="\([^"]*\).*/\1/')
		if [ $uploaded ]; then
			ival=$(grep 'name="ival"' $workfile | sed 's/.*value="\([^"]*\).*/\1/')
			echo "http://i$ival.tinypic.com/$uploaded.jpg"
		else echo "$1 failed"
		fi
		rm $workfile
	fi
}
	
(for arg in $*; do upload $arg; done; echo "-- done --")|zenity --title="TinyPicUploader" --text-info

