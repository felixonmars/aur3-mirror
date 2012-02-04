#!/bin/bash
# multicut_light.sh
# Benutzung auf eigene Gefahr !!!
# Anleitung  -> http://wiki.onlinetvrecorder.com/index.php/Cutlist-Austausch/Linux-Skripte 
# Diskussion -> http://otrforum.com/showthread.php?t=38342

Stand="18.05.2010"

# Konfiguration
ADversion="2.5"						# Version von Avidemux (2.4 oder 2.5)
ConvertUTF=1						# Bei Problemen mit Umlauten
moveOtrkey=1						# Otrkey nach dem dekodieren verschieben
SortOrder=3						# 0: rating 1: ratingbyauthor 2: ratingcount  3: Algorithmus
useSuggestedMovieName=1					# Vorgeschlagene Dateinamen benutzen
useCommentsforMovieName=0				# Kommentare mit in Vorschlaege einbeziehen
replaceWhitespace=1					# Im vorg. Dateinamen Leerzeichen durch Unterstriche ersetzen
Auto=0							# Automatik modus 
Smart=1							# Zuerst Cutlists auswaehlen, danach schneiden
News=0							# Skript-Versionen anzeigen
removeEDL=1						# EDL-Datei nach dem Anzeigen löschen
searchby="name"						# suchen anhand von "name", oder "size" 
tempdir="/tmp/multicut/"				# Verzeichnis für temporaere Dateien
rateCutlist=1						# Bewertung nach dem Schneiden abgeben
nachlauf=5						# Nachlauf zum Ueberpruefen mit dem mplayer
vorlauf=10						# Vorlauf zum Ueberpruefen mit dem mplayer
HQcutwithVD=0						# VirtualDub (via wine) fuer HQ benutzen
convertHQ2MKV=0						# HQ-AVIs in MKVs verwandeln
username=$(whoami)					# Username fuer VD-Pfad
vdubdir=$(ls /home/$username | grep VirtualDub)		# VD-Pfad
vdub="/home/$username/$vdubdir/vdub.exe"		# 
c_rot="\033[01;37;41m"					# Rot
c_blau="\033[01;37;44m"					# Blau
c_normal="\033[00m"					# Standardwert, nicht aendern
# Ende der Konfiguration - Konfigurationsblock kann auch unter ~/.multicut_light.rc gespeichert werden!

if [ -e ~/.multicut_light.rc ] ; then 
	echo "Benutze Konfigurations-Datei ..."
	source ~/.multicut_light.rc
fi

# Funktionen
checkUp () {						# System ueberpruefen und vorbereiten
rm -r $tempdir/cutlist* $tempdir/project* $tempdir/autoname* $tempdir/autoselect $tempdir/result* $tempdir/sugestedNames $tempdir/Comments* 2>/dev/null
if [ ! -e ~/.cutlist.at ] ; then			# pers. URL schon gespeichert ?
	CutListAT="http://www.cutlist.at"		# Nein -> Standard URL verwenden
	if [ $rateCutlist -eq 0 ] ; then
		printf "\n$c_rot Du hast rateCutlist=0 eingestellt und verwendest        $c_normal "
		printf "\n$c_rot keine pers. URL von cutlist.at !! 		         $c_normal "
		printf "\n$c_rot So kommen von dir keine Bewertungen ins Cutlist-System! $c_normal "
		printf "\n$c_rot Das ist nicht fair, bitte melde dich bei cutlist.at an  $c_normal\n\n"
		read -p "Weiter mit <Enter>: " eingabe
		echo
	fi
	
else 
	CutListAT=$(cat ~/.cutlist.at | head -n 1)	# Ja -> URL auslesen
fi

if 	! for i in avidemux{,2}{,_cli,_gtk,_qt4}; do
		# auf Existenz testen und ausschließen, dass es kein Link ist
		pfad=$(which $i) && ls -l $pfad | grep -v ^lrwx > /dev/null && avidemux=$i && break
	done
then
	printf "\n$c_rot Schneiden leider nicht moeglich, da avidemux nicht vorhanden ist $c_normal "
	printf "\n$c_rot Bitte installiere es, auf Debian basierten Systemen z.B. mit:    $c_normal "
	printf "\n$c_rot apt-get install avidemux                                         $c_normal \n\n "
	exit 1
fi

if [ $convertHQ2MKV -eq 1 ] ; then
	if ! type mkvmerge > /dev/null 2>/dev/null ; then	# Ist mkvmerge installiert?
		echo -e "\nmkvmerge ist nicht verfuegbar.\nBitte installiere es oder setze convertHQ2MKV=0!"
		exit 1
	fi		
fi

if [ $useSuggestedMovieName -eq 1 ] ; then
	if ! type dialog > /dev/null 2>/dev/null ; then		# Ist dialog installiert?
		echo -e "\nPaket 'dialog' ist nicht installiert.\nBitte installiere es (apt-get install dialog) oder setze useSuggestedMovieName=0!"
		exit 1
	fi		
fi

if [ ! -d cut ] ; then mkdir cut;fi;cutdir=${PWD%/}/cut
if [ ! -d uncut ] ; then mkdir uncut;fi;uncutdir=${PWD%/}/uncut
if [ ! -d decoded ] ; then mkdir decoded;fi;decodeddir=${PWD%/}/decoded
if [ ! -d $tempdir ] ; then mkdir $tempdir || (echo "Kann temporaeren Ordner nicht erstellen! Exit." && exit 1);fi 

tempdir=${tempdir%/} 
startdir=$PWD
SmartIndex=1
Datum=$(date +%Y%m%d)
logFile="$tempdir/multicut_light_$Datum.log"
writeLog "------------"
if [ $Smart -eq 1 ] ; then writeLog "Smart: yes"; fi
if [ $Auto -eq 1 ] ; then writeLog "Auto: yes"; fi
}
cleanUp () {						# System vor dem Schliessen wieder bereinigen
rm -r $tempdir/cutlist $tempdir/project.js $tempdir/project.syl $tempdir/autoselect $tempdir/result.xml $tempdir/result2.xml $tempdir/sugestedNames 2>/dev/null
limitreached=0
dontCut=0
filename=`cd ${file%/*} 2>/dev/null ; pwd`/${file##*/}	# absoluten dateinamen ermitteln
aviname=${filename##*/}
writeLog $aviname
uncutname="$uncutdir/$aviname"
}
parseXmlTag () {					# XML Tags auslesen
sed -n '/<\/'$1'>/p' $tempdir/result2.xml | sed -n ''$2'p' | sed 's/<'$1'>//' | sed 's/<\/'$1'>//g' | sed 's/^[ \t]*//'
}
getXml () {						# Cutlist Uebersicht vom Server holen
if [ $searchby == "size" ] ; then 			# Nach der Groesse suchen
	videoSize=$( stat -c %s $filename )	
	echo;echo $1
	echo "Hole Uebersicht (nach Groesse) von cutlist.at ..."
	wget -U "multicut_light.sh/$Stand" -q -O $tempdir/result.xml "$CutListAT/getxml.php?version=0.9.8.0&ofsb=$videoSize"
	if [ $? -ne 0 ] || [ $(cat $tempdir/result.xml | wc -l) -eq 0 ] ; then
		if [ $(cat $tempdir/result.xml | wc -l) -eq 0 ] ; then
			printf "$c_rot cutlist.at hat (noch) keine Uebersicht! $c_normal"
		else
			printf "$c_rot cutlist.at antwortet nicht!             $c_normal"
		fi	
	fi

else							# Nach dem Dateinamen suchen
	search=$(echo $1 | sed 's/.otrkey//g' | sed 's/DivFix++.//g' | sed 's/DivFix.//g' )
	echo;echo $1
	echo "Hole Uebersicht (nach Namen) von cutlist.at ..."
	wget -U "multicut_light.sh/$Stand" -q -O $tempdir/result.xml "$CutListAT/getxml.php?name=$search&version=0.9.8.0"
	if [ $? -ne 0 ] || [ $(cat $tempdir/result.xml | wc -l) -eq 0 ] ; then
		if [ $(cat $tempdir/result.xml | wc -l) -eq 0 ] ; then
			printf "$c_rot cutlist.at hat (noch) keine Uebersicht! $c_normal"
		else
			printf "$c_rot cutlist.at antwortet nicht!             $c_normal"
		fi
	fi
fi
readXml
}
readXml () {						# Uebersicht auslesen
cat $tempdir/result.xml | sed 's/<rating><\/rating>/<rating>0.00<\/rating>/g'> $tempdir/result2.xml
if [ $ConvertUTF -eq 1 ] ; then
	iconv -f iso-8859-1 -t utf-8 $tempdir/result2.xml --output $tempdir/result3.xml
	mv $tempdir/result3.xml $tempdir/result2.xml 2>/dev/null
fi
	
number=$(sed -n '2p' $tempdir/result.xml | cut -d'"' -f2)
if [ $(cat $tempdir/result.xml | wc -l) -eq 0 ] ; then 
	printf "\n$c_rot Es wurde keine Cutlist gefunden!         $c_normal \n"
	number=0
else
	echo "$number Cutlists gefunden"
	echo
	index=1
	while [ $index -le $number ] ; do
		Cutlist_id[$index]=$(parseXmlTag "id" $index)
		Cutlist_id[$index]=${Cutlist_id[$index]%[[:cntrl:]]}
		Cutlist_name[$index]=$(parseXmlTag "name" $index)
		Cutlist_name[$index]=${Cutlist_name[$index]%[[:cntrl:]]}
		Cutlist_rating[$index]=$(parseXmlTag "rating" $index)
		Cutlist_rating[$index]=${Cutlist_rating[$index]%[[:cntrl:]]}
		Cutlist_ratingcount[$index]=$(parseXmlTag "ratingcount" $index)
		Cutlist_ratingcount[$index]=${Cutlist_ratingcount[$index]%[[:cntrl:]]}
		Cutlist_downloadcount[$index]=$(parseXmlTag "downloadcount" $index)
		Cutlist_downloadcount[$index]=${Cutlist_downloadcount[$index]%[[:cntrl:]]}
		Cutlist_author[$index]=$(parseXmlTag "author" $index)
		Cutlist_author[$index]=${Cutlist_author[$index]%[[:cntrl:]]}
		Cutlist_ratingbyauthor[$index]=$(parseXmlTag "ratingbyauthor" $index)
		Cutlist_ratingbyauthor[$index]=${Cutlist_ratingbyauthor[$index]%[[:cntrl:]]}
		Cutlist_actualcontent[$index]=$(parseXmlTag "actualcontent" $index)
		Cutlist_actualcontent[$index]=${Cutlist_actualcontent[$index]%[[:cntrl:]]}
		Cutlist_usercomment[$index]=$(parseXmlTag "usercomment" $index)
		Cutlist_usercomment[$index]=${Cutlist_usercomment[$index]%[[:cntrl:]]}
		Cutlist_cuts[$index]=$(parseXmlTag "cuts" $index)
		Cutlist_cuts[$index]=${Cutlist_cuts[$index]%[[:cntrl:]]}
		Cutlist_withframes[$index]=$(parseXmlTag "withframes" $index)
		Cutlist_withframes[$index]=${Cutlist_withframes[$index]%[[:cntrl:]]}
		Cutlist_filename[$index]=$(parseXmlTag "filename" $index)
		Cutlist_filename[$index]=${Cutlist_filename[$index]%[[:cntrl:]]}
		Cutlist_filename_original[$index]=$(parseXmlTag "filename_original" $index)
		Cutlist_filename_original[$index]=${Cutlist_filename_original[$index]%[[:cntrl:]]}
		Cutlist_autoname[$index]=$(parseXmlTag "autoname" $index)
		Cutlist_autoname[$index]=${Cutlist_autoname[$index]%[[:cntrl:]]}
		Cutlist_duration[$index]=$(parseXmlTag "duration" $index)
		Cutlist_duration[$index]=${Cutlist_duration[$index]%[[:cntrl:]]}
		Cutlist_errors[$index]=$(parseXmlTag "errors" $index)
		Cutlist_errors[$index]=${Cutlist_errors[$index]%[[:cntrl:]]}
		Cutlist_othererrordescription[$index]=$(parseXmlTag "othererrordescription" $index)
		Cutlist_othererrordescription[$index]=${Cutlist_othererrordescription[$index]%[[:cntrl:]]}
		index=$((index+1))
	done
fi
return $number
}
showSelect () {						# Uebersicht auf dem Bildschirm darstellen
if [ $SortOrder -eq 3 ] ; then				# Sortierung
	index=1						# Sortierung vorbereiten
	while [ $index -le $number ] ; do
		if [ ${Cutlist_ratingbyauthor[$index]} -gt 3 ] ; then
			if [ ${Cutlist_ratingcount[$index]} -gt 1 ] ; then
				if [ $(echo "(${Cutlist_ratingbyauthor[$index]} - ${Cutlist_rating[$index]} + 1) * 100" | bc | egrep -o ^[0-9]*) -lt 150 ] ; then 
					Cutlist_ratingshow[$index]="$(echo "${Cutlist_ratingbyauthor[$index]} + ${Cutlist_rating[$index]} + (${Cutlist_ratingcount[$index]} / 10)" | bc)" 
				else 
					Cutlist_ratingshow[$index]=${Cutlist_rating[$index]}
				fi
			else 
				Cutlist_ratingshow[$index]=$((Cutlist_ratingbyauthor[$index]-1))
			fi
		else 
			Cutlist_ratingshow[$index]=${Cutlist_ratingbyauthor[$index]}
		fi
		echo -e "${Cutlist_ratingshow[$index]}\t$index" >> $tempdir/autoselect
		index=$((index+1))
	done
else
	index=1						# Sortierung vorbereiten
	while [ $index -le $number ] ; do
		if [ $SortOrder -eq 0 ] ; then 
			echo -e "${Cutlist_rating[$index]}\t$index" >> $tempdir/autoselect
		fi
		if [ $SortOrder -eq 1 ] ; then 
			echo -e "${Cutlist_ratingbyauthor[$index]}\t$index" >> $tempdir/autoselect
		fi
		if [ $SortOrder -eq 2 ] ; then 
			echo -e "${Cutlist_ratingcount[$index]}\t$index" >> $tempdir/autoselect
		fi
		index=$((index+1))
	done
fi

index=1
for line in $(sort -gr $tempdir/autoselect | cut -f2); do # Sortieren
	showindex[$index]=$line
	index=$((index+1))
done

index=1
if [ $(echo ${Cutlist_autoname[${showindex[$index]}]} | wc -w) -ne 0 ] ; then
	printf "\t$c_rot$aviname$c_normal\n"
	if [ $(echo $aviname | grep mpg.HQ.avi | wc -l) -ne 0 ] ; then
		Cutlist_autoname[${showindex[$index]}]="${Cutlist_autoname[${showindex[$index]}]}""_HQ"
	fi
        if [ $(echo $aviname | grep mpg.HD.avi | wc -l) -ne 0 ] ; then
                Cutlist_autoname[${showindex[$index]}]="${Cutlist_autoname[${showindex[$index]}]}""_HD"
        fi
	printf "\t$c_rot%s$c_normal\n" "${Cutlist_autoname[${showindex[$index]}]}"
	if [ $Smart -eq 1 ] ; then
		echo ${Cutlist_autoname[${showindex[$index]}]} > $tempdir/autoname$SmartIndex
	else
		echo ${Cutlist_autoname[${showindex[$index]}]} > $tempdir/autoname
	fi
else
	printf "\t$c_rot$aviname$c_normal\n"
fi
while [ $index -le $number ] ; do			# Uebersicht anzeigen
	echo
	if [ $(echo ${Cutlist_withframes[${showindex[$index]}]} | wc -c) == "1" ] ; then 
		FramesOrSeconds="(??????)"
	else
		if [ ${Cutlist_withframes[${showindex[$index]}]} == "1" ] ; then 
			FramesOrSeconds="(Frameangaben)"
		else 
			FramesOrSeconds="(Zeitangaben)"
		fi
	fi
	if [ $(echo ${Cutlist_author[${showindex[$index]}]} | wc -c) == "1" ] ;then 
		Cutlist_author[${showindex[$index]}]="n/a"
	fi
	if [ $(echo ${Cutlist_duration[${showindex[$index]}]} | wc -c) == "1" ] ;then 
		Cutlist_Duration="??:??:??"
	else 
		Cutlist_Duration=$(date -u -d @$(echo "${Cutlist_duration[${showindex[$index]}]}" | bc ) +%T)
	fi
	if [ $(echo ${Cutlist_cuts[${showindex[$index]}]} | wc -c) == "1" ] ;then 
		Cutlist_cuts[${showindex[$index]}]="?"
	fi
	if [ $(echo ${Cutlist_downloadcount[${showindex[$index]}]} | wc -c) == "1" ] ;then 
		Cutlist_downloadcount[${showindex[$index]}]="???"
	fi
	if [ $(echo ${Cutlist_name[${showindex[$index]}]} | grep .HQ.avi | wc -w) -eq 1 ] ; then
		Format="HQ!"
	elif [ $(echo ${Cutlist_name[${showindex[$index]}]} | grep .HD.avi | wc -w) -eq 1 ] ; then
		Format="HD!"
	else
		Format="avi"
	fi
	printf " $c_rot [%d] $c_normal \tSchnitte:  $c_blau %s $c_normal %s \tSpielzeit: $c_blau %s $c_normal (hh:mm:ss)\n  %s \tBewertung: $c_blau %s (%s/%s) $c_normal \tAutor:\t   $c_blau %s (%s) $c_normal\n" $index ${Cutlist_cuts[${showindex[$index]}]} $FramesOrSeconds $Cutlist_Duration $Format ${Cutlist_rating[${showindex[$index]}]} ${Cutlist_ratingcount[${showindex[$index]}]} "${Cutlist_downloadcount[${showindex[$index]}]}" "${Cutlist_author[${showindex[$index]}]}" "${Cutlist_ratingbyauthor[${showindex[$index]}]}"
	writeLog "verfuegbare Cutlist ID:${Cutlist_id[$index]} Autor:${Cutlist_author[$index]}"
	if [ ! ${Cutlist_errors[${showindex[$index]}]} == "000000" ] ; then	# Fehlerangaben
		printf "\tFehler:    $c_rot"
		if [ $(echo ${Cutlist_errors[${showindex[$index]}]} | cut -c1) -eq 1 ] ; then 
			printf " Anfang fehlt! "
		fi
		if [ $(echo ${Cutlist_errors[${showindex[$index]}]} | cut -c2) -eq 1 ] ; then 
			printf " Ende fehlt! "
		fi
		if [ $(echo ${Cutlist_errors[${showindex[$index]}]} | cut -c3) -eq 1 ] ; then 
			printf " Video! "
		fi
		if [ $(echo ${Cutlist_errors[${showindex[$index]}]} | cut -c4) -eq 1 ] ; then 
			printf " Audio! "
		fi
		if [ $(echo ${Cutlist_errors[${showindex[$index]}]} | cut -c5) -eq 1 ] ; then 
			printf " Fehler: ${Cutlist_othererrordescription[${showindex[$index]}]} "
		fi
		if [ $(echo ${Cutlist_errors[${showindex[$index]}]} | cut -c6) -eq 1 ] ; then 
			printf " EPG: ${Cutlist_actualcontent[${showindex[$index]}]} "
		fi
		printf "$c_normal\n"
	fi
	
	if [ $(echo ${Cutlist_usercomment[${showindex[$index]}]} | wc -w) -ne 0 ] ; then
		printf "\tKommentar: $c_blau %s $c_normal\n" "${Cutlist_usercomment[${showindex[$index]}]}"
		if [ $Smart -eq 1 ] && [ $useCommentsforMovieName -eq 1 ] ; then
			echo ${Cutlist_usercomment[${showindex[$index]}]} >> $tempdir/Commentscutlist$SmartIndex
		fi
	fi
	if [ $(echo ${Cutlist_filename_original[${showindex[$index]}]} | wc -w) -ne 0 ] ; then
		printf "\tDateiname: $c_blau %s $c_normal\n" "${Cutlist_filename_original[${showindex[$index]}]}"
		if [ $Smart -eq 1 ] ; then
			echo ${Cutlist_filename_original[${showindex[$index]}]} >> $tempdir/Commentscutlist$SmartIndex
		fi
	fi
	index=$((index+1))
done

if [ $overview -eq 1 ] ; then 				
	echo;read -p "Mit der Eingabe Taste bestaetigen ..."
	dontCut=1
else
	printf "\n $c_rot [%d] $c_normal \tKeine Auswahl. Diesen Film nicht schneiden.\n\n\n" 0 

	selected=""
	if [ $Auto -eq 1 ] ; then
		selected="1"
		printf "$c_rot Automatikmodus: Waehle die erste Cutlist! $c_normal \n"
	else
		read -p "Auswahl: " select
		showindex[0]="0"
		selected=${showindex[$select]}
	fi
	echo

	if [ $selected -ne 0 ] ; then
			if [ $Smart -eq 1 ] ; then
				echo $filename >> $tempdir/cutlist$SmartIndex
				echo $aviname >> $tempdir/cutlist$SmartIndex
				echo $uncutname >> $tempdir/cutlist$SmartIndex
				echo "$CutListAT/getfile.php?id=${Cutlist_id[$selected]}" >> $tempdir/cutlist$SmartIndex
				SmartIndex=$((SmartIndex+1))
			else
				wget -U "multicut_light.sh/$Stand" -q -O $tempdir/cutlist "$CutListAT/getfile.php?id=${Cutlist_id[$selected]}"
			fi
			writeLog "gewaehlte Cutlist ID:${Cutlist_id[$selected]} Autor:${Cutlist_author[$selected]}" 
	else
		dontCut=1
		rm $tempdir/autoname$SmartIndex $tempdir/autoname $tempdir/Commentscutlist$SmartIndex 2>/dev/null
	fi
fi
}
project_start () { 					# Projektdatei fuer Avidemux oeffnen 
cat << HEADER > $tempdir/project.js
//AD
var app = new Avidemux();
//** Video **
// 01 videos source
app.load("$filename");

// 0$numberofCuts segments
app.clearSegments();
HEADER
}
project_end () { 					# Projektdatei fuer Avidemux schliessen 
if [ $ADversion == "2.5" ] ; then
cat << FOOTER >> $tempdir/project.js
app.video.setPostProc(3,3,0);
app.video.fps1000=$fpsAD;
app.video.codec("Copy","CQ=4","0 ");
app.audio.reset();
app.audio.codec("copy",128,0,"");
app.audio.normalizeMode=0;
app.audio.normalizeValue=0;
app.audio.delay=0;
app.audio.mixer="NONE";
app.audio.scanVBR="";
app.setContainier="AVI";
setSuccess(app.save("$cutname"));
FOOTER
else
cat << FOOTER >> $tempdir/project.js
app.video.setPostProc(3,3,0);
app.video.setFps1000($fpsAD);
app.video.codec("Copy","CQ=4","0 ");
app.audio.reset();
app.audio.codec("copy",128,0,"");
app.audio.normalizeMode=0;
app.audio.normalizeValue=0;
app.audio.delay=0;
app.audio.mixer("NONE");
app.audio.scanVBR();
app.setContainer("AVI");
setSuccess(app.save("$cutname"));
FOOTER
fi
}
VDproject_start () { 					# Projektdatei fuer VirtualDub oeffnen 
cat << HEADER > $tempdir/project.syl
VirtualDub.Open("$filename",0,0);
VirtualDub.audio.SetMode(0);
VirtualDub.video.SetMode(1);
VirtualDub.video.SetSmartRendering(1);
VirtualDub.video.SetCompression(0x53444646,0,10000,0);
HEADER
}
VDproject_compData () {					# Projektdatei fuer VirtualDub 4:3 Modus
cat << COMPDATA >> $tempdir/project.syl
VirtualDub.video.SetCompData(2847,"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");
COMPDATA
}
VDproject_compData169 () {				# Projektdatei fuer VirtualDub 16:9 Modus
cat << COMPDATA169 >> $tempdir/project.syl
VirtualDub.video.SetCompData(2853,"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");
COMPDATA169
}
VDproject_end () { 					# Projektdatei fuer VirtualDub schliessen 
cat << FOOTER >> $tempdir/project.syl
VirtualDub.SaveAVI("$cutname");
VirtualDub.Close();
FOOTER
}
showCuts () {
checktime[0]=0					
index=0
while [ $index -lt $numberofCuts ] ; do			# Zeitpunke fuer mplayer festlegen
	helpindex=$index
	index=$((index+1))
	checktime[$index]=$(echo "(${checktime[$helpindex]} + ${durationTime[$index]})" | bc)
	echo -e "$(echo "${checktime[$helpindex]} + $nachlauf" | bc )\t $(echo "${checktime[$index]} - $vorlauf" | bc ) \t 0" >> $cutname.edl
	counter=250					# Untertitel Countdown
	while [ $counter -ne 0 ] ; do
		echo "{$(echo "(${checktime[$index]} * $fps) - $counter - 10" | bc | cut -d"." -f1)}{$(echo "(${checktime[$index]} * $fps) - $counter + 15" | bc | cut -d"." -f1)}Schnitt #$index in $(echo "($counter / $fps)" | bc) Sekunden" >> $cutname.sub
		counter=$((counter-25))
	done
	echo "{$(echo "(${checktime[$index]} * $fps) - $counter - 10" | bc | cut -d"." -f1)}{$(echo "(${checktime[$index]} * $fps) - $counter + 15" | bc | cut -d"." -f1)}=-> SCHNITT <-=" >> $cutname.sub
done
echo "Schnitte mit mplayer zeigen -> Eingabetaste";read
mplayer -edl $cutname.edl -sub $cutname.sub -osdlevel 3 $cutname 1>/dev/null 2>/dev/null
rm $cutname.edl $cutname.sub

if [ $rateCutlist -ne 0 ] ; then 
	bewerten
fi
}
showEDL () {
numberofCuts=$(grep ^Start\= $tempdir/cutlist | wc -l) 
fps=$( grep FramesPerSecond $tempdir/cutlist | tr -d "\r" | sed 's/FramesPerSecond=//' )
startFrames=$(grep ^Start\= $tempdir/cutlist | cut -d"=" -f2)
index=1
for frame in $startFrames ; do				# Startframes festlegen
	frame=${frame%[[:cntrl:]]}
	if [ $frame == "0" ] ; then 
		frame="1.00"
	fi
	startFrame[$index]=$frame
	index=$((index+1))
done

durationFrames=$(grep ^Duration\= $tempdir/cutlist | cut -d"=" -f2)
index=1
for frame in $durationFrames ; do			# Duration Frames festlegen
	frame=${frame%[[:cntrl:]]}
	durationFrame[$index]=$frame
	index=$((index+1))
done

index=0
echo "mplayer zeigt folgende Zeitintervalle an:";echo
while [ $index -lt $numberofCuts ] ; do			# Schnittzeiten auf dem Bildschirm ausgeben
	helpindex=$index
	index=$((index+1))
	echo -e "$(date -u -d @$(echo "${startFrame[$index]} + 0" | bc ) +%T) -> $(date -u -d @$(echo "${durationFrame[$index]} + ${startFrame[$index]}" | bc ) +%T) hh:mm:ss"
done

durationFrame[0]=0
startFrame[0]=0
numberofCuts=$((numberofCuts+1))
startFrame[$numberofCuts]=1000000
index=0
while [ $index -lt $numberofCuts ] ; do			# Schnittzeiten in edl Datei schreiben
	helpindex=$index
	index=$((index+1))
	echo -e "$(echo "${durationFrame[$helpindex]} + ${startFrame[$helpindex]}" | bc )\t $(echo "0 + ${startFrame[$index]}" | bc ) \t 0" >> $filename.edl
done

echo
echo "mplayer steuern:  (weiteres mit man mplayer)"
echo "o                 Zeitinformationen ein/aus!"
echo "<- / ->           Vor / Zurueck (10 Sekunden)"
echo "hoch / runter     Vor / Zurueck (1 Minute)"
echo "pgup / pgdown     Vor / Zurueck (10 Minuten)"
echo "p / Leertaste     Pause (Weiter)"
echo "f                 Vollbild"
echo "m                 Stumm"
echo "9 / 0             Leiser / Lauter"
echo
mplayer -edl $filename.edl $filename 1>/dev/null 2>/dev/null
if [ $removeEDL -eq 1 ] ; then
	rm $filename.edl 2>/dev/null
fi
if [ $rateCutlist -eq 1 ] ; then
	printf "\n$c_rot mplayer -edl zeigt die Schnitte leider nicht ganz genau an $c_normal \n"
	printf "$c_rot Im Zweifelsfall bitte eine bessere Bewertung angeben! $c_normal \n"
	bewerten
fi
exit 0
}
cutFilm () {						# Film schneiden
pathname=$(echo $filename | sed "s/$aviname//g")
if [ $(echo $filename | grep "\.otrkey" | wc -l) -eq 1 ] ; then # Vorher dekodieren?
	filename=$(echo $filename | sed 's/\.otrkey//g')
	aviname=${filename##*/}
	pathname=$(echo $filename | sed "s/$aviname//g")
	Decode $filename.otrkey $aviname $uncutdir
	filename="$uncutdir/$aviname"
	uncutname="$uncutdir/$aviname"
	echo
fi

mplayer -vo null -nosound -frames 1 "$filename" 2>&1 | 	# Pruefe ob der Index defekt ist
while read line; do
	if [[ $line == "Could not determine number of frames"* ]] ; then
		printf "$c_rot Der Index ist defekt, repariere ... $c_normal\n"
		writeLog "repariere Index: $filename"
		mencoder -msglevel all=0 -msglevel statusline=5 -idx -ovc copy -oac copy -o $filename.indexed $filename
		echo;echo
		mv $filename $filename.original.avi
		mv $filename.indexed $filename
	fi
done
if [ $Smart -eq 1 ] ; then
	printf "$c_rot Schneide $aviname $c_normal\n"
fi

frameData=$(grep ^StartFrame $tempdir/cutlist | wc -l) 
numberofCuts=$(grep NoOfCuts= $tempdir/cutlist | cut -d"=" -f2)
numberofCuts=${numberofCuts%[[:cntrl:]]}
fps=$( grep FramesPerSecond $tempdir/cutlist | tr -d "\r" | sed 's/FramesPerSecond=//' )
fpsAD=$(echo "$fps*1000" | bc | egrep -o ^[0-9]*)
if [ $frameData -ne 0 ] ; then			# Werte zum schneiden festlegen
	echo "Verwende Frameangaben"
	echo "Framerate    : $fps fps"
	writeLog "schneide $aviname (Frameangaben)"
	startFrames=$(grep ^StartFrame $tempdir/cutlist | cut -d"=" -f2)
	index=1
	for frame in $startFrames ; do			# Startframes festlegen
		startFrame[$index]=${frame%[[:cntrl:]]}
		index=$((index+1))
	done
	durationFrames=$(grep ^DurationFrames $tempdir/cutlist | cut -d"=" -f2)
	index=1
	for frame in $durationFrames ; do		# Duration Frames festlegen
		durationFrame[$index]=${frame%[[:cntrl:]]}
		index=$((index+1))
	done
else
	echo "keine Frameangaben gefunden, rechne Zeitangaben in Frames um"
	echo "Framerate    : $fps fps"
	writeLog "schneide $aviname (Zeitangaben)"
	startFrames=$(grep ^Start $tempdir/cutlist | cut -d"=" -f2)
	index=1
	for frame in $startFrames ; do			# Startframes festlegen
		frame=${frame%[[:cntrl:]]}
		if [ $frame == "0" ] || [ $(echo $frame | grep -F 0.00 | wc -l) -eq 1 ] ; then frame="0.04";fi
		startFrame[$index]=$(echo "$frame * $fps + 0.5" | bc | egrep -o ^[0-9]*)
		index=$((index+1))
	done
	durationFrames=$(grep ^Duration $tempdir/cutlist | cut -d"=" -f2)
	index=1
	for frame in $durationFrames ; do		# Duration Frames festlegen
		frame=${frame%[[:cntrl:]]}
		durationFrame[$index]=$(echo "$frame * $fps + 0.5" | bc | egrep -o ^[0-9]*)
		if [ -z "${durationFrame[$index]}" ] ; then durationFrame[$index]="0";fi
		index=$((index+1))
	done
fi
durationTimes=$(grep ^Duration= $tempdir/cutlist | cut -d"=" -f2)
index=1
for frame in $durationTimes ; do		# Duration Frames festlegen
	frame=${frame%[[:cntrl:]]}
	durationTime[$index]=$frame
	if [ -z "${durationTime[$index]}" ] ; then durationTime[$index]="0";fi
	index=$((index+1))
done

if [ $(echo $filename | grep mpg.H[QD].avi | wc -l) -eq 0 ] || [ $HQcutwithVD -eq 0 ] ; then	# Pruefe ob HQ vorliegt
	if [ $(grep -c ^MERGED $tempdir/cutlist) -ne 0 ] ; then
		printf "\n   $c_blau Merging $c_normal\n\n"
		cd $pathname
		Merged=$(grep ^MERGED $tempdir/cutlist | cut -d"=" -f2 | sed 's/;/\n/g')
		for merge in $Merged ; do
			if [ -e $pathname/$merge ] ; then
				echo "$merge existiert"
			else
				if [ -e $pathname/$merge.otrkey ] ; then
					echo "$merge.otrkey existiert -> dekodiere"
					Decode $merge.otrkey $merge $pathname
				else
					echo "Datei ist nicht vorhanden! Abbruch!" 
					exit 1
				fi	
			fi
		done
		Merged=$(grep ^MERGED $tempdir/cutlist | cut -d"=" -f2 | sed 's/;/ /g')
		mv $Merged $uncutdir 2>/dev/null
		mv $filename $uncutdir 2>/dev/null
		cd $uncutdir
		avimerge -i $aviname $Merged -o $(echo $filename | sed 's/TVOON_DE/MERGED/g')
		aviname=$(echo $aviname | sed 's/TVOON_DE/MERGED/g')
		filename=$(echo $filename | sed 's/TVOON_DE/MERGED/g')		
		cd $pathname
		uncutname="$uncutdir/$aviname"
	fi
	project_start						# Wenn nicht dann verwende avidemux
	getAspect "$filename"
	aspectRatio=$?
	if [ $aspectRatio -eq 1 ] ; then
		echo "Aspect Ratio : 4:3"; echo
	fi
	if [ $aspectRatio -eq 2 ] ; then
		echo "Aspect Ratio : 16:9"; echo
	fi
	index=1
	while [ $index -le $numberofCuts ] ; do			# Schnitte in AD Projekt Datei einfuegen
		echo "app.addSegment(0,${startFrame[$index]},${durationFrame[$index]})" >> $tempdir/project.js
		writeLog "Schnitt: ${startFrame[$index]},${durationFrame[$index]}"
		if [ $Smart -eq 1 ] ; then
			echo "${durationFrame[$index]}" >> $tempdir/project.smart$Smartindex
			echo "${durationTime[$index]}" >> $tempdir/projectTimes.smart$Smartindex
		fi
		index=$((index+1))
	done
	if [ $(echo $filename | grep mpg.HQ.avi | wc -l) -ne 0 ] ; then 
		cutname="$cutdir/${aviname%.mpg.HQ.avi}-cut.HQ.avi"
	elif [ $(echo $filename | grep mpg.HD.avi | wc -l) -ne 0 ] ; then
		cutname="$cutdir/${aviname%.mpg.HD.avi}-cut.HD.avi"
	else
		cutname="$cutdir/${aviname%.mpg.avi}-cut.avi"
	fi
	project_end
	nice -n 15 $avidemux --force-smart --run $tempdir/project.js --quit 1>/dev/null 
	echo;echo
	mv $filename $uncutname 2> /dev/null
else								# sonst verwende VirtualDub via wine
	if [ -e $vdub ] ; then 					# VD installiert?
		VDproject_start
		getAspect "$filename"
		aspectRatio=$?
		if [ $aspectRatio -eq 1 ] ; then
			echo "Aspect Ratio : 4:3"; echo
			VDproject_compData
		fi
		if [ $aspectRatio -eq 2 ] ; then
			echo "Aspect Ratio : 16:9"; echo
			VDproject_compData169
		fi
		echo "VirtualDub.subset.Clear();" >> $tempdir/project.syl
		index=1
		while [ $index -le $numberofCuts ] ; do		# Schnitte in VD Projekt Datei einfuegen
			echo "VirtualDub.subset.AddRange(${startFrame[$index]},${durationFrame[$index]});" >> $tempdir/project.syl
			writeLog "Schnitt: ${startFrame[$index]},${durationFrame[$index]}"
			if [ $Smart -eq 1 ] ; then
				echo "${durationFrame[$index]}" >> $tempdir/project.smart$Smartindex
				echo "${durationTime[$index]}" >> $tempdir/projectTimes.smart$Smartindex
			fi
			index=$((index+1))
		done
		cutname="$cutdir/${aviname%.mpg.HQ.avi}-cut.HQ.avi"
	        if [ $(echo $filename | grep mpg.HQ.avi | wc -l) -ne 0 ] ; then
	                cutname="$cutdir/${aviname%.mpg.HQ.avi}-cut.HQ.avi"
	        elif [ $(echo $filename | grep mpg.HD.avi | wc -l) -ne 0 ] ; then
	                cutname="$cutdir/${aviname%.mpg.HD.avi}-cut.HD.avi"
		fi
		VDproject_end
		cd $tempdir
		wine "$vdub" /s project.syl /x 2>&1 |
		while read line; do				# Warten bis VD beendet wird
			vdpid=$(pgrep vdub.exe)
			if [ "$line" == "fixme:avifile:AVIFileExit (): stub!" ] ; then
			kill -s 9 "$vdpid";
			fi
		done
		cd $startdir
		if [ $? -eq 0 ] && [ -f "$cutname" ] ; then	# VD erfolgreich?
			mv $filename $uncutname 2> /dev/null
			if [ $convertHQ2MKV -eq 1 ] ; then
				printf "\n$c_rot Zu Matroska Format konvertieren ... $c_normal\n\n"
				mkvmerge -o $cutname.mkv $cutname	# zu mkv konvertieren
				echo
				mv $cutname $cutname.backup.avi
				mv $cutname.mkv $cutname
			fi
		else
			printf "\n$c_rot Es ist ein Fehler aufgetreten, die Datei wurde nicht geschnitten $c_normal \n"
			echo
			exit 1
		fi
	else
		printf "\n$c_rot VirtualDub ist nicht installiert!? Schneiden nicht moeglich. $c_normal \n"
		echo
		exit 1
	fi
fi
}
bewerten () {						# Bewertung abgeben
if [ $Auto -eq 0 ] ; then
	printf "\n$c_rot Bitte eine Bewertung fuer die Cutlist abgeben... $c_normal\n\n"
	echo "[0] Dummy oder keine Cutlist"
	echo "[1] Anfang und Ende grob geschnitten"
	echo "[2] Anfang und Ende halbwegs genau geschnitten"
	echo "[3] Schnitt ist annehmbar, Werbung entfernt"
	echo "[4] doppelte Szenen wurde nicht entfernt oder schoenere Schnitte moeglich"
	echo "[5] Saemtliches unerwuenschtes Material wurde framegenau entfernt"
	echo "[#] Jetzt nicht bewerten"
	echo
	read -p "Auswahl: " bewertung
	while [ "$bewertung" == "" ] ; do
		read -p "Auswahl: " bewertung
	done
	if [ $bewertung == "#" ] ; then
		echo
	else
		writeLog "Sende Bewertung:$bewertung fuer Cutlist-ID:${Cutlist_id[$selected]}"
		wget -U "multicut_light.sh/$Stand" -q -O - "$CutListAT/rate.php?rate=${Cutlist_id[$selected]}&rating=$bewertung" | tee -a $logFile
		writeLog ""
		echo
	fi
fi
}
ReNameFile () {						# Vorgeschlagene Dateinamen benutzen
if [ $Smart -eq 1 ] ; then
	cp $tempdir/Commentscutlist$Smartindex $tempdir/sugestedNames 2>/dev/null
	cp $tempdir/autoname$Smartindex $tempdir/autoname 2>/dev/null
else
	if [ $localCutlist -eq 1 ] ; then
		grep SuggestedMovieName= $tempdir/cutlist | cut -d"=" -f2 > $tempdir/sugestedNames2
		if [ $useCommentsforMovieName -eq 1 ] ; then
			grep UserComment= $tempdir/cutlist | cut -d"=" -f2 >> $tempdir/sugestedNames2
		fi
		sed -e "/^ *$/d" $tempdir/sugestedNames2 > $tempdir/sugestedNames
	else
		index=1
		while [ $index -le $number ] ; do			# Dateinamen und Kommentare auslesen
			if [ $(echo ${Cutlist_filename[$index]} | wc -w) -ne 0 ] ; then
				echo ${Cutlist_filename[$index]} >> $tempdir/sugestedNames
			fi
			if [ $(echo ${Cutlist_usercomment[$index]} | wc -w) -ne 0 ] && [ $useCommentsforMovieName -eq 1 ] ; then
				echo ${Cutlist_usercomment[$index]} >> $tempdir/sugestedNames
			fi
			index=$((index+1))
		done
	fi
fi

autoname=$(cat $tempdir/autoname 2>/dev/null)
if [ $(echo $autoname | wc -w) -ne 0 ] ; then
	if [ $replaceWhitespace -eq 1 ] ; then 
		autoname=$(echo $autoname | tr " " "_")
	fi
	printf "$c_rot Autoname: %s.avi $c_normal \n" "$autoname"
	mv -i "$cutname" "$cutdir/$autoname.avi"
	writeLog "autoname $autoname.avi"
else
	printf "$c_rot Waehle einen Dateinamen zum editieren aus: $c_normal\n\n"
	if [ -e $tempdir/sugestedNames ] ; then			# Vorschlaege ausgeben
		index=1
		sort $tempdir/sugestedNames | uniq | 
		while read line ; do 
			printf " $c_rot [%d] $c_normal \t " $index
			echo $line
			index=$((index+1))
		done
	else
		sugestedName=$aviname
	fi

	echo
	printf " $c_rot [#] $c_normal \t %s \n" "$(echo ${aviname%.mpg.avi}-cut.avi | sed 's/_TVOON_DE//g')"
	printf " $c_rot [0] $c_normal \t Eigenen Namen eingeben \n"
	echo

	read -p "Auswahl: " auswahl
	if [ $auswahl == "#" ] ; then				# Umbenennen nach Auswahl
		sugestedName="$(echo ${aviname%.mpg.avi}-cut.avi | sed 's/_TVOON_DE//g')"
		mv -i "$cutname" "$cutdir/$sugestedName"
		writeLog "rename $sugestedName"
	else
		if [ $auswahl -eq 0 ] ; then
			sugestedName="$(echo ${aviname%.mpg.avi}-cut.avi | sed 's/_TVOON_DE//g')"
		else
			if [ $replaceWhitespace -eq 0 ] ; then 
				sugestedName=$(sort $tempdir/sugestedNames | uniq | head -n$auswahl | tail -n1).avi
			else
				sugestedName=$(sort $tempdir/sugestedNames | uniq | head -n$auswahl | tail -n1 | tr " " "_").avi
			fi
		fi
		dialog --inputbox "Dateiname editieren:" 7 70 "$sugestedName" 2> $tempdir/sugfile
		if [ $? -eq 1 ] ; then				# kein Vorschlag bei Abbruch
			echo
		else
			sugestedName=$(cat $tempdir/sugfile)
			rm $tempdir/sugfile
			mv -i "$cutname" "$cutdir/$sugestedName"
			writeLog "rename $sugestedName"
		fi
	fi
fi
rm $tempdir/sugestedNames $tempdir/sugestedNames2 $tempdir/autoname 2>/dev/null
echo
}
showNews () {						# Skript Versionen anzeigen
StandWiki=$(wget -q -O - "http://wiki.onlinetvrecorder.com/index.php/Cutlist-Austausch/Linux-Skripte" | grep "Version vom:" | cut -d">" -f3 | cut -d"<" -f1 | head -n1)
printf "\nSkript-Versionen - Lokal: $Stand  -  Wiki: $StandWiki"
if [ ! $Stand == $StandWiki ] ; then
	printf "   $c_rot !!! Neue Version verfügbar !!! $c_normal\n"
fi
echo
}
Decode () {						# Otrkey entschluesseln
if type otrdecoder &> /dev/null ; then 
	otrdecoder=$(type otrdecoder)
else 
	printf "$c_rot otrdecoder nicht gefunden! $c_normal\n"
	exit 1
fi
if [ ! -e ~/.otrdecoder ] ; then			# decoder config vorhanden ?
	printf "$c_rot decoder config nicht gefunden! $c_normal\n"
	exit 1
else 
	email=$(cat ~/.otrdecoder | grep mail | awk '{ print $3 }')		
	password=$(cat ~/.otrdecoder | grep password | awk '{ print $3 }')	
fi
printf "$c_rot Dekodiere $2.otrkey $c_normal\n"
writeLog "dekodiere $2.otrkey"
nice -n 15 $otrdecoder -q -i $1 -o $3 -e $email -p $password 2>> $logFile
if [ $? -ne 0 ] ; then 
	echo "Fehler $? aufgetreten!"
	exit 1
fi
if [ ! -e $uncutdir/$2 ] ; then 
	echo "Fehler aufgetreten, dekodierte Datei nicht vorhanden!"
	exit 1
fi
if [ $moveOtrkey -eq 1 ] ; then
	if [ ! -d decoded ] ; then mkdir decoded;fi;decodeddir=${PWD%/}/decoded 
	mv $1 $decodeddir
fi
}
Download () {						# Otrkey download
if [ ! -d decoded ] ; then mkdir decoded;fi;decodeddir=${PWD%/}/decoded 
if type otrdecoder &> /dev/null ; then 
	otrdecoder=$(type otrdecoder)
else 
	printf "$c_rot otrdecoder nicht gefunden! $c_normal\n"
	exit 1
fi
if [ ! -e ~/.otrdecoder ] ; then			# decoder config vorhanden ?
	printf "$c_rot decoder config nicht gefunden! $c_normal\n"
	exit 1
else 
	email=$(cat ~/.otrdecoder | grep mail | awk '{ print $3 }')		
	password=$(cat ~/.otrdecoder | grep password | awk '{ print $3 }')	
fi
printf "$c_rot Dekodiere $2 $c_normal\n"
nice -n 15 $otrdecoder -q -i $1 -C $tempdir/cutlist -o $3 -e $email -p $password
if [ $? -ne 0 ] ; then 
	echo "Fehler aufgetreten!"
	exit 1
fi
if [ $moveOtrkey -eq 1 ] ; then
	if [ ! -d decoded ] ; then mkdir decoded;fi;decodeddir=${PWD%/}/decoded 
	mv $2 $2.segments $decodeddir
fi
}
getAspect () {                        # Aspect Ratio erfassen
    aspectR=$(
        mplayer -vo null -nosound "$1" 2>&1 |
        while read line; do                	# Warten bis mplayer aspect-infos liefert oder anfaengt zu spielen
            [[ $line =~ Aspe[ck]t.is.*1\.33:1 ]] && echo 1 && break
            [[ $line =~ Aspe[ck]t.is.*0\.56:1 ]] || [[ $line =~ Aspe[ck]t.is.*1\.78:1 ]] && echo 2 && break
            [[ $line == "VO: [null]"* ]] && echo 0 && break
        done
    pkill -n mplayer
    )
    return $aspectR  # returns 1 (4:3), 2 (16:9) oder 0 (Aspect Ratio nicht erkannt)
}
writeLog () {						# schreibe Log-Datei
echo "$(date +%H:%M:%S) $1" >> $logFile
}
smartModus () {						# Smart-Modus
SmartNo=$(ls $tempdir/cutlist* 2>/dev/null | wc -l)
Smartindex=1
while [ $Smartindex -le $SmartNo ] ; do			# schneiden
	printf "   $c_blau Smart-Modus $Smartindex/$SmartNo $c_normal\n\n"
	filename=$(cat $tempdir/cutlist$Smartindex | tail -n4 | head -n1)
	aviname=$(cat $tempdir/cutlist$Smartindex | tail -n3 | head -n1)
	uncutname=$(cat $tempdir/cutlist$Smartindex | tail -n2 | head -n1)
	cutlisturl=$(cat $tempdir/cutlist$Smartindex | tail -n1)
	wget -U "multicut_light.sh/$Stand" -q -O $tempdir/cutlist $cutlisturl
	fps=$( grep FramesPerSecond $tempdir/cutlist | tr -d "\r" | sed 's/FramesPerSecond=//' )
	echo "$fps" > $tempdir/fps.$Smartindex
	fpsAD=$(echo "$fps*1000" | bc | egrep -o ^[0-9]*)
	if [ $(cat $tempdir/cutlist | wc -l) -ne 0 ] ; then
		cutFilm $filename
	else
		cat $tempdir/cutlist
	fi
	rm $tempdir/cutlist
	Smartindex=$((Smartindex+1))
done

Smartindex=1				# Pruefen, bewerten und umbenennen
while [ $Smartindex -le $SmartNo ] ; do	
	printf "   $c_blau Smart-Modus $Smartindex/$SmartNo $c_normal\n\n"
	aviname=$(cat $tempdir/cutlist$Smartindex | tail -n3 | head -n1 | sed 's/\.otrkey//g')
	if [ $(echo $aviname | grep HQ.avi | wc -l) -eq 1 ] ; then
		cutname="$cutdir/${aviname%.mpg.HQ.avi}-cut.HQ.avi"
	elif [ $(echo $aviname | grep HD.avi | wc -l) -eq 1 ] ; then
		cutname="$cutdir/${aviname%.mpg.HD.avi}-cut.HD.avi"
	else
		cutname="$cutdir/${aviname%.mpg.avi}-cut.avi"
	fi
	if [ ! -e $cutname ] ; then
		aviname=$(echo $aviname | sed 's/TVOON_DE/MERGED/g')
		cutname=$(echo $cutname | sed 's/TVOON_DE/MERGED/g')
	fi
	printf "$c_rot Pruefe $aviname $c_normal\n"	
	numberofCuts=$(cat $tempdir/project.smart$Smartindex 2>/dev/null | wc -l)
	durationFrames=$(cat $tempdir/project.smart$Smartindex)
	durationTimes=$(cat $tempdir/projectTimes.smart$Smartindex)
	fps=$(cat $tempdir/fps.$Smartindex)
	index=1
	for frame in $durationFrames ; do		# Duration Frames festlegen
		durationFrame[$index]=${frame%[[:cntrl:]]}
		index=$((index+1))
	done
	index=1
	for frame in $durationTimes ; do		# Duration Times festlegen
		durationTime[$index]=${frame%[[:cntrl:]]}
		index=$((index+1))
	done
	Cutlist_id[$selected]=$(cat $tempdir/cutlist$Smartindex | tail -n1 | cut -d"=" -f2)
	if [ $rateCutlist -eq 1 ] ; then
		showCuts
	fi
	if [ $useSuggestedMovieName -eq 1 ] ; then
		ReNameFile
	fi
	Smartindex=$((Smartindex+1))
done

}
help () {						# Hilfe (Optionen) anzeigen
cat << END
Aufruf:
$0 [options] files

Moegliche Optionen:

-s	Anhand der Dateigroesse anstatt des Dateinamens suchen
-c	Lokale Cutlist benutzen:
	multicut_light.sh -c (path/to/)Film.cutlist Film.mpg.avi(.otrkey)
-edl    nicht schneiden, edl-Datei fuer mplayer erstellen und starten
-ue	Nur die Übersicht anzeigen
-rate	Schnitte anzeigen und bewerten
-remote Schnitte nicht anzeigen und nicht bewerten
-auto   Automatik-Modus
-smart  Zuerst Cutlists auswaehlen, danach schneiden 
-url	persöhnliche Cutlist.at URL speichern
        ( -url http://www.cutlist.at/user/0123456789abcdef
        ohne letzten Schraegstrich ! )
-name	Vorgeschlagene Dateinamen benutzen
-news	Skript-Versionen anzeigen

(c) bowmore@otrforum $Stand 
    HQ-Unterstuetzung von MKay@otrforum
END
exit 1
}

# Start 
overview=0
edl=0
localCutlist=0

while [ "$1" != "${1#-}" ] ; do				# uebergebene Parameter abfragen
	case ${1#-} in
		s) searchby="size"; shift;;
		c) localCutlist=1; Smart=0; rateCutlist=0; shift; localCutlistPath="${1#-}"; shift;;
		edl) edl=1;Smart=0; shift;;
		ue) overview=1;Smart=0; shift;;
		rate) rateCutlist=1; shift;;
		remote) rateCutlist=0; shift;;
		auto) Auto=1; shift;;
		smart) Smart=1; shift;;
		url) shift;echo $1 > ~/.cutlist.at;exit 0;;
		name) useSuggestedMovieName=1;shift;;
		news) showNews;exit 1;;
		*) help; exit 1;;
	esac
done

checkUp $1

if [ $News -eq 1 ] ; then showNews ; fi			# Version anzeigen
for file in ${@:-*.mpg*.avi*}; do			# einzelne Dateien durchgehen
	cleanUp
	if [ $localCutlist -eq 1 ] ; then
		number=1
	else
		getXml $aviname				# Uebersicht holen
	fi
	if [ $number -ne 0 ] ; then 			# Cutlists vorhanden?
		if [ $(echo $file | grep -c http://) -eq 1 ] ; then
			Smart=0
		fi
		if [ $localCutlist -eq 1 ] ;then
			cp $localCutlistPath $tempdir/cutlist
		else
			showSelect			# Ja -> anzeigen
		fi
		if [ $(echo $file | grep -c http://) -eq 1 ] || [ $(echo $file | grep -c ftp://) -eq 1 ] ; then 
			Download $file $aviname $cutdir
			exit 1
		fi
		if [ $limitreached -eq 0 ] && [ $dontCut -eq 0 ] && [ $Smart -eq 0 ] ; then 	# Limit? keine Auswahl?
			if [ $edl -eq 1 ] ; then	# edl fuer mplayer erstellen?
				showEDL	
			else
				cutFilm $filename 	# Film schneiden
			fi
			if [ ! $Auto -eq 1 ] && [ $rateCutlist -eq 1 ] ; then	# Schnitte mit mplayer anzeigen ?
				showCuts 
			fi
			if [ $useSuggestedMovieName -eq 1 ] && [ $Auto -eq 0 ] ; then 
				ReNameFile		# Datei umbenennen
			fi
		fi
	fi
done

if [ $Smart -eq 1 ] ; then smartModus ;fi		# Smart Modus
if [ -e ~/.multicut_light_finish.sh ] ; then ~/.multicut_light_finish.sh ;fi # pers. Skript zum Ende ausfuehren

exit 0
