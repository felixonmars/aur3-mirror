#!/bin/sh
# Create a html gallery
FILE="";
let "nbfiles = $#"
#kdeinstdir=`kde4-config --prefix`
TITLE=`zenity --entry --title="Titre " --text="Veuillez saisir le nom du fichier pdf"`;

if DIR=`zenity --title "Selecionner le repertoire où stocker le fichier pdf" --file-selection --directory`
then
  echo "DIR = $DIR";
else 
  exit 0;
fi
stapler cat $@ $TITLE".pdf"
