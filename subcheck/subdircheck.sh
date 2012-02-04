#!/bin/sh

if [ -z $1 ]

then 
    	echo "Checking all srt files in current directory ..."  
	find . -name "*.srt" -exec subcheck -t -B -q -i {} \; &&
	echo "Checking of all srt files in current directory done ..."

else
    	echo "Checking all srt files in directory $1 ..."  
	find "$1" -name "*.srt" -exec subcheck -t -B -q -i {} \; &&
	echo "Checking of all srt files in directory $1 done ..."
fi



