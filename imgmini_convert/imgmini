#!/bin/bash

if [ -n "`echo "$@"|grep "\-help"`" ] || [ -n "`echo "$@"|grep "\-h"`" ] || [ -z "$1" ]  || [ -z "$2" ]; then
echo "imgmini /folder/with/photos/to/minimalization /folder/for/minimalized/photos dpi_pref_600 NOPREF_files_names_without_mini_prefix"
exit 0
fi
if [ -d $1 ]; then
cd "$1"
else
echo "Folder with photos dont exist"                                                                               
exit 0                                                                                                                                           
fi

if [ ! -d $2 ]; then
`mkdir $2`
fi

if  [ -n "`echo $3|grep -w '[0-9]\{1,\}'`" ]; then
rozmiar="-scale $3"
fi

if [ "$4" = "NOPREF" ]; then
mini=""
else 
mini="mini-"
fi

if [ -n "`ls|grep .jpg`" ];then
formaty="$formaty *.jpg"
fi

if [ -n "`ls|grep .JPG`" ];then               
formaty="$formaty *.JPG"                       
fi 

if [ -n "`ls|grep .png`" ];then                                                                                                                  
formaty="$formaty *.png"
fi

if [ -n "`ls|grep .PNG`" ];then
formaty="$formaty *.PNG"
fi

if [ -n "`ls|grep .gif`" ];then                                                                                                                  
formaty="$formaty *.gif"                                                                                                                         
fi 

if [ -n "`ls|grep .GIF`" ];then
formaty="$formaty *.GIF"
fi

`ls -1 $formaty>/tmp/imgminimalize-list`
`sed -e '/^mini/d' /tmp/imgminimalize-list > /tmp/imgminimalize-listtmp; mv /tmp/imgminimalize-listtmp /tmp/imgminimalize-list`
iloscplikow=`cat /tmp/imgminimalize-list|grep "" -c`
i=1
while [ $i -le $iloscplikow ]; do
orgphoto=`sed -n "$i p;$i q" /tmp/imgminimalize-list`
miniphoto="$2/$mini$orgphoto"
`convert $rozmiar "$orgphoto" "$miniphoto"`
echo $miniphoto
i=$[10#$i + 10#1]
done
`rm /tmp/imgminimalize-list`
