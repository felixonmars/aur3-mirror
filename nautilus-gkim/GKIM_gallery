#!/bin/sh
# Create a html gallery
FILE="";
let "nbfiles = $#"
#kdeinstdir=`kde4-config --prefix`
KIM_DIR=/usr/share/GKIM/gallery
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
SCALE_1="800x800";
SCALE_2="200x200";
if K=`zenity --entry --title="Nombre de colonnes" --text="Veuillez saisir le nombre de colonnes : " --entry-text="4"`
then
  echo "K = $K";
else 
  exit 0;
fi

if DIR=`zenity --title "Selecionner le repertoire où stocker la gallery" --file-selection --directory`
then
  echo "DIR = $DIR";
else 
  exit 0;
fi

W="200";
H="150";


# Creation of directories
mkdir $DIR/images;
mkdir $DIR/thumbs;
# Header of $DIR/index.html
cp $KIM_DIR/index.part1_gallery $DIR/index.html;
echo '<h1>'$TITLE'</h1>' >> $DIR/index.html;
echo '<h5>Auteur: '$AUTHOR'<br>Date: '$DATE'</h5>' >> $DIR/index.html;
echo '<table><tr>' >> $DIR/index.html;

(compteur=0;
tmp=0;
for i in "$@";do
	if [ -f "$i" ];then
		#test if cancel button has been pushed
		let "compteur +=1"
		let "tmp +=1"
		FILE="$i";
		IMAGE=`basename "$FILE"`;
		convert -resize $SCALE_1 "$FILE" $DIR/images/"$IMAGE";
		convert -resize $SCALE_2 "$FILE" $DIR/thumbs/"$IMAGE";
		W2=`identify -format "%w" $DIR/images/"$IMAGE"`;
		H2=`identify -format "%h" $DIR/images/"$IMAGE"`;
		echo '<td align='center'>' >> $DIR/index.html;
		if [ "$H2" -lt "$W2" ];
		then echo '<a href="images/'"$IMAGE"'"><img class="photo" src="thumbs/'"$IMAGE"'" width="'$W'" height="'$H'" alt="thumbs/'"$IMAGE"'" title="'"$IMAGE"'"></a>' >> $DIR/index.html;
		else echo '<a href="images/'"$IMAGE"'"><img class="photo" src="thumbs/'"$IMAGE"'" width="'$H'" height="'$W'" alt="thumbs/'"$IMAGE"'" title="'"$IMAGE"'"></a>' >> $DIR/index.html;
		fi;
		echo '<p>'"$IMAGE"'</p>' >> $DIR/index.html;
		echo '</td>' >> $DIR/index.html;
		if [ "$tmp" -eq "$K" ];
		then 	echo '</tr><tr>' >> $DIR/index.html;
			tmp=0;
		fi
	fi;
done
)|zenity --progress \
          --title="Création de la gallery" \
          --text="traitement" \
          --percentage=0;

cat $KIM_DIR/index.part2_gallery >> $DIR/index.html;


firefox $DIR/index.html;