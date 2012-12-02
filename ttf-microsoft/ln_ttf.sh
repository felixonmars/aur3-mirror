#!/bin/bash
ttf_need=(arialbd.ttf arialbi.ttf ariali.ttf ARIALNBI.TTF ARIALNB.TTF ARIALNI.TTF ARIALN.TTF arial.ttf calibrib.ttf calibrii.ttf calibrili.ttf calibril.ttf calibri.ttf calibriz.ttf CAMBRIAB.TTF CAMBRIAI.TTF CAMBRIA.TTC CAMBRIAZ.TTF consolab.ttf consolai.ttf consola.ttf consolaz.ttf courbd.ttf courbi.ttf couri.ttf cour.ttf msyhbd.ttf msyh.ttf simfang.ttf simhei.ttf simkai.ttf SIMLI.TTF simsun.ttc SIMYOU.TTF tahomabd.ttf tahoma.ttf timesbd.ttf timesbi.ttf timesi.ttf times.ttf verdanab.ttf verdanai.ttf verdana.ttf verdanaz.ttf)
ttf_lost=()

font_path="/mnt/Windows/Fonts"
[[ $1 != "" ]]&&font_path=$1
if [[ ! -d $font_path ]];then
    echo "Usage: $0 [win7 fonts path]"
    echo "       default the path is /mnt/Windows/Fonts"
    echo "       \$font_path:$font_path does not exist."
    exit 1
fi

for ttf in ${ttf_need[@]}
do
    [ -L $ttf -o -e $ttf ]&&rm ./$ttf
    ln -sv $font_path/$ttf ./$ttf
    [ ! -e $ttf ]&&ttf_lost+=($ttf)
done
[[ "${ttf_lost[@]}" == "" ]]&&echo "==> Done.Now you can run makepkg."||\
    echo -e "Some lost fonts:\n${ttf_lost[@]}"
