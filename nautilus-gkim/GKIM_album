#!/bin/bash
# GKIM based on KIM
# Copyright (C) 2005,2006  Charles Bouveyron <charles.bouveyron@free.fr>
# 
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

dir="$1";
nb=`zenity --list --title="Sélectionnez le type de l'album" --column="n°" --column="Type " 1 "1x1 portrait album" 2 "1x1 landscape album" 3 "1x2 landscape album" 4 "2x1 portrait album" 5 "2x2 landscape album" 6 "3x2 portrait album" 7 "3x4 landscape album" 8 "4x4 landscape album"`;


#test -n "$KDEHOME" || KDEHOME="`kde4-config --localprefix`"; export KDEHOME
#KIMDIR=`mktemp -d "$KDEHOME"/tmp-"$USER"/kim.XXXXXXXX` || exit 1
KIMDIR=`mktemp -d /tmp/kim.XXXXXXXX` || exit 1

(
echo "10";
case "$nb" in
1)	montage -tile 1x1 -geometry 800x600+5+5 -page 842x595 "$@" "$KIMDIR"/miniature.jpg
	montage -tile 1x1 -geometry 600x800+5+5 -page 842x595 "$KIMDIR"/miniature*.jpg* `zenity --file-selection --title="Sauvegarder sous (pdf)..." --save`;;

2)	montage -tile 1x1 -geometry 800x600+5+5 -page 595x842 "$@" "$KIMDIR"/miniature.jpg
	montage -tile 1x1 -geometry 800x600+5+5 -page 595x842 "$KIMDIR"/miniature*.jpg* `zenity --file-selection --title="Sauvegarder sous (pdf)..." --save`;;

3)	montage -tile 1x2 -geometry 640x480+5+5 -page 595x842 "$@" "$KIMDIR"/miniature.jpg
	montage -tile 1x1 -geometry 640x480+5+5 -page 595x842 "$KIMDIR"/miniature*.jpg* `zenity --file-selection --title="Sauvegarder sous (pdf)..." --save`;;
	
4)	montage -tile 1x2 -geometry 640x480+5+5 -page 842x595 "$@" "$KIMDIR"/miniature.jpg
	montage -tile 1x1 -geometry 480x640+5+5 -page 842x595 "$KIMDIR"/miniature*.jpg* `zenity --file-selection --title="Sauvegarder sous (pdf)..." --save`;;
	
5)	montage -tile 2x2 -geometry 640x480+5+5 -page 595x842 "$@" "$KIMDIR"/miniature.jpg
	montage -tile 1x1 -geometry 640x480+5+5 -page 595x842 "$KIMDIR"/miniature*.jpg* `zenity --file-selection --title="Sauvegarder sous (pdf)..." --save`;;
	
6)	montage -tile 2x3 -geometry 640x480+5+5 -page 842x595 "$@" "$KIMDIR"/miniature.jpg 
	montage -tile 1x1 -geometry 480x640+5+5 -page 842x595 "$KIMDIR"/miniature*.jpg* `zenity --file-selection --title="Sauvegarder sous (pdf)..." --save`;;

7)	montage -tile 4x3 -geometry 640x480+5+5 -page 595x842 "$@" "$KIMDIR"/miniature.jpg 
	montage -tile 1x1 -geometry 640x480+5+5 -page 595x842 "$KIMDIR"/miniature*.jpg* `zenity --file-selection --title="Sauvegarder sous (pdf)..." --save`;;
	
8)	montage -tile 4x4 -geometry 640x480+5+5 -page 595x842 "$@" "$KIMDIR"/miniature.jpg 
	montage -tile 1x1 -geometry 640x480+5+5 -page 595x842 "$KIMDIR"/miniature*.jpg* `zenity --file-selection --title="Sauvegarder sous (pdf)..." --save`;;

*) zenity --error --text="GKim - Unrecognized option ! ";;
esac

echo "80";
#rm "$KIMDIR"/miniature*.jpg*
rm -rf "$KIMDIR"
echo "100";
)|        zenity --progress \
          --title="Création de l'album" \
          --text="traitement" \
          --percentage=0



