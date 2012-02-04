#!/bin/dash
# By pmd - http://pmdz.info // slighly modified to remove zenity dependance
# But : Envoyer simplement une image vers uppix.net // sans zenity
# Paquets requis : curl
# Licence : http://creativecommons.org/licenses/by-nc-sa/2.0/fr/
#           Paternité - Pas d'Utilisation Commerciale - Partage des Conditions Initiales à l'Identique

# Configuration
FICHIER=$1
MIMETYPE=$(file -bi "$FICHIER")
URL=uppix.net
MAX_TAILLE_FICHIER=2000000 #2Mo (fixé par uppix.net)

# Verifier le fichier avant envoi
TAILLE_FICHIER=$(stat -c%s "$FICHIER")
if [ $TAILLE_FICHIER -gt $MAX_TAILLE_FICHIER ]; then
	{
        echo "Erreur, le fichier $FICHIER est trop lourd ($TAILLE_FICHIER octets pour une limite de $MAX_TAILLE_FICHIER maximum)."
        exit 1
	}
fi

# Envoyer le fichier, et enregistrer la page résultat
TEMPFILE=$(tempfile)
echo "Envoi de $FICHIER vers $URL ..."
curl $URL -F myimage=@"$FICHIER" -F submit=Upload -F formup=1 -H "Expect:" -o $TEMPFILE --progress-bar


# Analyser la page pour extraire les donnees
VIEWPAGE=$(grep -oEm 1 '\[url\=([^]]*)' $TEMPFILE | sed 's/\[url\=//')
IMAGE_BIG=$(grep -oEm 1 '\[img\]([^[]*)' $TEMPFILE | sed 's/\[img\]//')

NB_IMG=$(grep -c '\[img\]' $TEMPFILE)
if [ "$NB_IMG" -eq "1" ]; then # Si ya pas besoin de miniature
	{
	IMAGE_MINI=$IMAGE_BIG
	}
elif [ "$NB_IMG" -ge "2" ] || [ "$NB_IMG" -le "3" ]; then # Si ya besoin de miniature
	{
	IMAGE_MINI=$(echo $VIEWPAGE | sed 's/\.html//')"t.jpg"
	}
else
	{
	echo "La disposition de présentation du code à changé dans uppix.net."
	exit 2
	}
fi
rm $TEMPFILE

# Resultat de l'upload : le code a placer dans un forum
BBCODE="[url=$VIEWPAGE][img]$IMAGE_MINI[/img][/url]"
ZCODE="<lien url=\"$VIEWPAGE\"><image>$IMAGE_MINI</image></lien>"
#    ="<lien url="$VIEWPAGE"><image>$IMAGE_MINI</image></lien>"

# On affiche
echo "
Fichier : $FICHIER
Type : $MIMETYPE

Lien :$VIEWPAGE
Image :$IMAGE_BIG
Miniature :$IMAGE_MINI
BBCode :$BBCODE
ZCode :$ZCODE"
