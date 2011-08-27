#!/bin/sh

# Copyright Dirk Bierfeld (AKA Arathis), 2010

# Shows length of video/audio files in minutes
LINGUA=$(echo $LANG | cut -d '_' -f 1)
case $LINGUA in
	en|EN)
		LINGUA_FILE="files"
		LINGUA_MIN="min"
		LINGUA_SUM="Overall length"
		;;
	de|DE)
		LINGUA_FILE="Dateien"
		LINGUA_MIN="Min"
		LINGUA_SUM="Gesamtlänge"
		;;
esac
VIDCOUNT=0
FORMAT_GES=M
if [[ "$1" =  "--help" || "$1" = "" ]]; then
	echo ""
	case $LINGUA in
		en|EN)
			echo "Show length of video/audio files in minutes. Single and overalllength."
			echo ""
			echo "mlength --help|FILE1 FILE2 *"
			;;
		de|DE)
			echo "Gibt Länge von Videos in Minuten an. Einzel- und Gesamtlänge."
			echo ""
			echo "mlength --help|DATEI1 DATEI2 *"
			;;
	esac
	echo ""
else
	echo
	for FILE in "$@"; do
		if [ ! "$FILE" = "" ]; then
			if [ -f "$FILE" ]; then
				if [ ! "$(midentify "$FILE")" = "ID_EXIT=EOF" ]; then
					VIDSEC=$(midentify "$FILE" | grep ID_LENGTH | cut -b 11-)
					VIDMIN=$(genius --exec=$VIDSEC/60)
					VIDMIN_SAVE="$VIDMIN"
					VIDGES=$(genius --exec=$VIDGES+$VIDMIN)
					VIDMIN_1=$(echo $VIDMIN | cut -d "." -f 1)
					VIDMIN_2=$(echo $VIDMIN | cut -d "." -f 2 | cut -b -2)
					if [ "$(echo $VIDMIN_2 | cut -c 2)" = "" ]; then
						VIDMIN_2="$(($VIDMIN_2*10))"
					fi
					if [ "$VIDMIN_2" = "0" ]; then
						VIDMIN_2=$VIDMIN_2\0
					elif [ ! "$(echo $VIDMIN_2 | cut -c 1)" = "0" ]; then
						if [ "$(($VIDMIN_2/10))" = "0" ]; then
							VIDMIN_2=$VIDMIN_2\0
						fi
					fi
					VIDMIN="$VIDMIN_1.$VIDMIN_2"
					VIDSIZE=$(du -m "$FILE" | cut -f 1)
					VIDSIZEGES=$((($VIDSIZEGES+$VIDSIZE)))
					VIDCOUNT=$((($VIDCOUNT+1)))
					if [ "$(($VIDMIN_1/10))" = "0" ]; then
						VIDMIN="  $VIDMIN"
					elif [ "$(($VIDMIN_1/100))" = "0" ]; then
						VIDMIN=" $VIDMIN"
					fi
					FILE_CUT="$(echo $FILE | rev | cut -d '/' -f 1 | rev)"
					echo -e "$VIDMIN $LINGUA_MIN   \033[1;34m$FILE_CUT\033[0m  [$VIDSIZE MB]"
				fi
			fi
		fi
	done
	if [ ! "$VIDGES" = "$VIDMIN_SAVE" ]; then
		VIDGES_1=$(echo $VIDGES | cut -d "." -f 1)
		VIDGES_2=$(echo $VIDGES | cut -d "." -f 2 | cut -b -2)
		VIDGES="$VIDGES_1.$VIDGES_2"
		if [ $(($VIDGES_1>=60)) = 1 ]; then
			FORMAT_GES=H
			VIDGES2=$(genius --exec=$VIDGES/60)
			VIDGES2_1=$(echo $VIDGES2 | cut -d "." -f 1)
			VIDGES2_2=$(echo $VIDGES2| cut -d "." -f 2)
			VIDGES2_2=$(genius --exec=0.$VIDGES2_2*60 | cut -d '.' -f 1)
		fi
		echo ""
		echo -e "\033[1;32m$VIDCOUNT $LINGUA_FILE\033[0m // \033[1;32m$VIDSIZEGES MB\033[0m"
		if [ $FORMAT_GES = M ]; then
			case $LINGUA in
				en|EN)
					if [ $(($VIDGES_2<=1)) = 1 ]; then
						MIN="minute"
					else
						MIN="minutes"
					fi
					;;
				de|DE)
					if [ $(($VIDGES_2<=1)) = 1 ]; then
						MIN="Minute"
					else
						MIN="Minuten"
					fi
					;;
			esac
			echo -e "\033[1;32m$LINGUA_SUM:\033[0m $VIDGES $MIN"
		elif [ $FORMAT_GES = H ]; then
			case $LINGUA in
				en|EN)
					if [ "$(($VIDGES2_1<=1))" = "1" ]; then
						STD="hour"
					else
						STD="hours"
					fi
					if [ "$(($VIDGES2_2<=1))" = "1" ]; then
						MIN="minute"
					else
						MIN="minutes"
					fi
					;;
				de|DE)
					if [ "$(($VIDGES2_1<=1))" = 1 ]; then
						STD="Stunde"
					else
						STD="Stunden"
					fi
					if [ "$(($VIDGES2_2<=1))" = 1 ]; then
						MIN="Minute"
					else
						MIN="Minuten"
					fi
					;;
			esac
			echo -e "\033[1;32m$LINGUA_SUM:\033[0m $VIDGES2_1 $STD, $VIDGES2_2 $MIN"
		fi
	fi
fi
echo
exit 0
