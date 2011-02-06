#!/bin/bash
# Auto rotate
FILE="";




(compteur=0
for i in "$@";do
	if [ -f "$i" ];then
		let "compteur +=1"
		FILE="$i"
		if  file $FILE | grep -q JPEG ; then
				jhead -autorot $FILE
		fi
		echo "$compteur";
	fi;
done
)|        zenity --progress --auto-close\
          --title="Auto rotate" \
          --text="traitement" \
          --percentage=0;



