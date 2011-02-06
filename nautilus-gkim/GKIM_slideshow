#!/bin/bash
# Create a Flash slideshow
FILE="";


KIM_DIR='/usr/share/GKIM/slideshow'
if TITLE=`zenity --entry --title="Titre" --text="Veuillez saisir le titre"`
then
  echo "TITLE = $TITLE";
else 
  exit 0;
fi

if AUTHOR=`zenity --entry --title="Titre" --text="Veuillez saisir l'auteur" --entry-text="$USER"`
then
  echo "AUTHOR = $AUTHOR";
else 
  exit 0;
fi

DATE=`date '+%A %-d %B %Y'`;
if SCALE=`zenity --entry --title="Titre" --text="Veuillez saisir la résolution des images" --entry-text="600x450"`
then
  echo "SCALE = $SCALE";
else 
  exit 0;
fi

if DIR=`zenity --title "Selecionner le repertoire où stocker le slideshow" --file-selection --directory`
then
  echo "DIR = $DIR";
else 
  exit 0;
fi

W=`echo $SCALE | sed 's/[^0-9]/ /g' | awk '{print $1}'`;
H=`echo $SCALE | sed 's/[^0-9]/ /g' | awk '{print $2}'`;

DIR=`echo $DIR | sed 's/" "/"\ "/g'`;
echo $DIR ;
mkdir "$DIR"/images;
mkdir "$DIR"/images/tmp;
cp $KIM_DIR/dewslider.swf "$DIR";
# Header of "$DIR"/index.html
cp $KIM_DIR/index.part1 "$DIR"/index.html;
echo '<h1>'$TITLE'</h1>' >> "$DIR"/index.html;
echo '<h5>Auteur: '$AUTHOR'</h5>' >> "$DIR"/index.html;
echo '<h5>Date: '$DATE'</h5>' >> "$DIR"/index.html;
let W2="$W+40";
let H2="$H+60";
echo '<object type="application/x-shockwave-flash" data="dewslider.swf?xml=dewslider.xml" width="'$W2'" height="'$H2'">' >> "$DIR"/index.html;
cat $KIM_DIR/index.part2 >> "$DIR"/index.html;
# Header of "$DIR"/dewslider.xml
echo '<?xml version="1.0" ?>' > "$DIR"/dewslider.xml;
echo '<album' >> "$DIR"/dewslider.xml;
echo 'width="'$W'" height="'$H'"' >> "$DIR"/dewslider.xml;
echo 'bgcolor="0xeeeeee" framecolor="0xffffff" padding="10" margin="10"' >> "$DIR"/dewslider.xml;
echo 'shadow="8" shadowopacity="15%" shadowcolor="0x000000" showbuttons="on"' >> "$DIR"/dewslider.xml;
echo 'buttonstyle="flat" showtxt="on" txtcolor="0xcccccc" auto="5" fullscreen="off"' >> "$DIR"/dewslider.xml;
echo '>' >> "$DIR"/dewslider.xml;

(compteur=0
for i in "$@";do
	if [ -f "$i" ];then
		let "compteur +=1"
		FILE="$i"
		#convert -resize $SCALE "$FILE" "$DIR"/images/`basename "$FILE"`.jpg;
		width=`identify -format "%w" "$FILE"`;
    	height=`identify -format "%h" "$FILE"`;
		if [ "$width" -gt "$height" ]; then
			convert -resize $SCALE "$FILE" "$DIR"/images/`basename "$FILE"`.jpg;
		else
			convert -gravity Center -crop "80x80%%+0+0"   -resize ${W}"x" +repage -crop ${W}"x"${H}"+0+0" -resize "x"${H} +repage -crop ${W}"x"${H}"+0+0" -blur 0x40 +repage   "$FILE"  "$DIR"/images/tmp/`basename "$FILE"`_1.jpg;
			convert -resize ${W}"x"${H}  "$FILE"  "$DIR"/images/tmp/`basename "$FILE"`_2.jpg;
			convert "$DIR"/images/tmp/`basename "$FILE"`_1.jpg  "$DIR"/images/tmp/`basename "$FILE"`_2.jpg -gravity Center -composite "$DIR"/images/`basename "$FILE"`.jpg
		fi
		echo '<img src="images/'`basename "$FILE"`'.jpg" title="'`basename "$FILE"`'" />' >> "$DIR"/dewslider.xml;
		echo "$compteur";
	fi;
done
)|        zenity --progress \
          --title="Création du slideshow" \
          --text="traitement" \
          --percentage=0;

rm -r "$DIR"/images/tmp;
echo '</album>' >> "$DIR"/dewslider.xml;

firefox "$DIR"/index.html;
