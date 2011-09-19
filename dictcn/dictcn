#!/bin/bash

##############  customization  #################
### color theme (see terminal colour convention)
# key word
keycolr="7"
# pronunciation
proncolr="1"
# defination
defcolr="1;32"
# related translation
relcolr="0;32"
# sentences
sentcolr="0"
# emphasis
emphcolr="3"

### media player
player="mplayer"
################################################

function help() {
echo 'dictcn script'
echo 'Requires:   wget xml2 cut sed'
echo '            xsel:       for -s support'
echo '            libnotify:  for -n support'
echo '            mplayer:    for -p support'
echo 'Usage: dictcn [-w WORD|-s] [-n] [-p] [-c]'
echo '-w WORD     get word to look up from WORD'
echo '-s          get word to look up from selection'
echo '-n          send to notification'
echo '-p          pronounce the word if available'
echo '-c          colored output for terminal (you can customize it in the script)'
echo '-h          print help'
}

word=""
sendp=""
pronp=""
colrp=""

while getopts w:nshpc opt; do
    case "$opt" in
        w)  word="$OPTARG" ;;
        s)  word="`xsel -o`" ;;
        n)  sendp=1;;
        p)  pronp=1;;
        c)  colrp=1;;
        h)  help; exit 0;;
        ?)  help; exit 1;;
    esac
done
if [ -z "$word" ]; then help; exit 1; fi

xml="$(wget -q -O - "http://dict.cn/ws.php?utf8=true&q=$word" | xml2)"
key="$(echo "$xml" | grep key | cut -d = -f 2-)"
audio="$(echo "$xml" | grep audio | cut -d = -f 2-)"
pron="$(echo "$xml" | grep pron | cut -d = -f 2- | sed 's/^ //g')"
def="$(echo "$xml" | grep def | cut -d = -f 2-)"
rel="$(echo "$xml" | grep rel | cut -d = -f 2- -s)"
sent="$(echo "$xml" | grep sent | cut -d = -f 2- -s)"

[ ! -z "$pron" ] && pron="[$pron]";
if [ ! -z "$rel" ]; then
    nrel="\n$rel\n";
    crel=$(echo "\033[${relcolr}m\n$rel\033[0m\n" \
        | sed "s/<em>/\\\\033\\[${emphcolr}m/g;s/<\\/em>/\\\\033\\[${relcolr}m/g");
fi
if [ ! -z "$sent" ]; then
    nsent="例句:\n$sent";
    csent=$(echo "\033[${sentcolr}m例句:\n$sent\033[0m" \
        | sed "s/<em>/\\\\033\\[${emphcolr}m/g;s/<\\/em>/\\\\033\\[${sentcolr}m/g");
fi

title="$key $pron"

body=$(echo "\n$def\n$nrel\n$nsent" | sed 's/<em>//g;s/<\/em>//g;s/</[/g;s/>/]/g')

chromatic=$(echo "\033[${keycolr}m$key\033[0m \033[${proncolr}m$pron\033[0m\n
\033[${defcolr}m$def\033[0m\n$crel\n$csent" \
    | sed 's/<em>//g;s/<\/em>//g;s/</[/g;s/>/]/g')

if [ ! -z $colrp ]; then echo -e "$chromatic"; else echo -e "$title" "\n$body"; fi
if [ ! -z $sendp ]; then notify-send "$title" "$body"; fi

if [ ! -z $pronp ] && [ ! -z $audio ]; then
    tempfile=`mktemp`
    wget -qO "$tempfile" "$audio" 
    $player "$tempfile" &> /dev/null;
fi
