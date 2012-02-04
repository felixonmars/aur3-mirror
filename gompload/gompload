#!/bin/bash

############## Gompload 0.2
#      Author:  Scott Garrett <Wintervenom@gmail.com>
# Description:  A fancy ompload wrapper.
#    Requires:  ompload html2text
#      Syntax:  gompload [FILE1 FILE2 DIR1 DIR2 ...]
##############


status="/tmp/gompload_status.html"
outfile="/tmp/gompload_tmp.html"

function update_status {
    echo "<html><head><title>Gompload: Uploading Files</title><meta http-equiv='refresh' content='1'></head><body><h1>Gompload: Uploading Files</h1><h3>Uploading file $filenum of $numfiles.</h3><hr /><strong>Current file: </strong> $@<hr /><small><em>Gompload 0.1.1 by Scott Garrett</em></small></body></html>" > $status
	clear
	html2text -style pretty $status
}

function upload {
	sleep 2
	url="$(ompload "$@" 2>&1 | awk '/Omploaded/ {print $NF}')"
	if [ $url ]; then
		suffix=$(echo "$@" | awk -F . '{print $NF}')
		echo "<li><a target='_blank' href=\"${url}.${suffix}\">$@<div style='font-style: italic'>==&gt; ${url}.${suffix}</div></a></li>" >> $outfile
	else
		echo "<li style='color:red'><strong>[UPLOAD FAILED]</strong> <em>$@</em></li>" >> $outfile
	fi
}

if [[ $# != 0 ]]; then
	filenum=0
	numfiles=$#
	update_status "<em>Preparing to upload...</em>"
	echo "<html><head><title>Gompload: Upload Complete</title></head><body><h1>Gompload: Upload Complete</h1><h3>Here are the results for your uploaded files.</h3><hr /><ol>" > $outfile
	until [ -z "$1" ]; do
		if [ -d "$1" ]; then
			update_status "<strong>[COUNTING]</strong> <em>$1</em>"
			files=$(find "$1" -type f)
			let "numfiles+= $(echo "$files" | wc -l)"
            let "numfiles-=1"
			update_status "<strong>[READING]</strong> <em>$1</em>"
			unset files_a y
			while read -d $'\0' file; do
				files_a[y++]="$file"
			done < <( find "$1" -type f -print0)
			for (( x=0; x<${#files_a[*]}; x++ )); do
				let "filenum+=1"
				update_status "${files_a[x]}<br /><strong>Directory:</strong> $1"
				upload "${files_a[x]}"
			done
		else
			if [ -f "$1" ]; then
				let "filenum+=1"
				update_status "$1"
				upload "$1"
			else
				echo "<li style='color:red'><strong>[NOT FOUND]</strong> <em>$1</em></li>" >> $outfile
			fi
		fi
		shift
	done
	echo "</ol><hr /><small><em>Gompload 0.1.1 by Scott Garrett</em></small></body></html>" >> $outfile
	mv -f $outfile $status
	clear
	html2text -style pretty $status
else
	echo "Syntax:  $0 FILE [FILE FILE ...]"
	echo "Recurse: $0 DIR [DIR DIR]"
	echo "You can also drag and drop files/directories you want to upload onto Gomploader's icon in GNOME/KDE."
fi
