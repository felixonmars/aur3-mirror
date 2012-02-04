#!/bin/bash
# Resize image
FILE=""

if SCALE=`zenity --entry --title="Titre" --text="Veuillez saisir la résolution des images" --entry-text="600x450"`
then
  echo "SCALE = $SCALE";
else 
  exit 0;
fi


W=`echo $SCALE | sed 's/[^0-9]/ /g' | awk '{print $1}'`;
H=`echo $SCALE | sed 's/[^0-9]/ /g' | awk '{print $2}'`;


(compteur=0
for i in "$@";do
	if [ -f "$i" ];then
		let "compteur +=1"
		FILE="$i"
		convert -resize $SCALE "$FILE" "$FILE";
		echo "$compteur";
	fi;
done
)|        zenity --progress --auto-close\
          --title="Resize" \
          --text="traitement" \
          --percentage=0;
