#!/usr/bin/env zsh
pastebin() {
    case "${${1##*//}%%/*}" in
        sprunge.us)
            url="${1%\?*}"
            ;;
        raw.github.com|gist.github.com)
            [[ "${${1##*//}%%\.*}" == "gist" ]] && url="https://raw.github.com/gist/${1##*/}" || url="$1"
            ;;
        pastebin.com)
            [[ ${${1##*com/}%\.php*} == "raw" ]] && url=$1 || url="http://pastebin.com/raw.php\?i\=${1##*/}"
            ;;
        codepad.org)
            url="$1/raw.txt"
            ;;
        dpaste.org|dpaste.de)
            url="$1/raw/"
            ;;
        dpaste.com)
            url="$1/plain/"
            ;;
        pastebin.ca)
            url=http://pastebin.ca${${${(f)$(curl $1 |grep raw)}#*href=\"}%%\"*}
            ;;
        paste.dy.fi)
            url="${1%%\?*}/plain"
            ;;
        pastebin.ca|www.pastebin.ca)
            url="${1%/*}/raw/${1##*/}"
            ;;
        pastebin.org)
            url="${1%/*}/pastebin.php\?dl\=${1##*/}"
            ;;
        pastie.org)
            #url="${1%/*}/pastes/${1##*/}/download"
            if [[ ${${1##*org/}%%/*} == "pastes" ]];then
                url="$1/download"
            else
                url=${${${${${${(Mf)$(curl $1 |grep raw )}#*\"}%%\"*}//text/download}//\?/\\\?}//=/\\=}
            fi
            ;;
        bpaste.net)
            url="${1%/sh*}/raw/${1#*ow/}"
            ;;
        fpaste.org)
            url="$1/raw/"
            ;;
        pastebin.mozilla.org)
            url="${1%/*}/pastebin.php\?dl\=${1##*/}"
            ;;
        hpaste.org)
            url="${1%/*}/raw/${1##*/}"
            ;;
        aur.archlinux.org)
            if [[ "${1##*/}" == "PKGBUILD" ]];then
                url="$1" 
            else
                if [[ $AURLINKS != "comments" ]];then 
                    url=${(Mf)$( curl $1 2>&/dev/null):#*PKGBUILD*}
                    url=https://aur.archlinux.org/"${${url##*=\'}%\'*}"
                fi
            fi
            ;;
        www.archlinux.org)
            if [[ "${${1##*org/}%%/*}" == "packages" ]];then
                repo="${${1##*ages/}%%/*}"
                package="${${1%/*}##*/}"
                url="https://projects.archlinux.org/svntogit/$repo.git/plain/trunk/PKGBUILD\?h\=packages/$package"
            fi
            ;;
        ompldr.org)
            url=$1
            ;;
        imgur.com)
            imageurl=$(curl $1 2>&/dev/null |grep -Ei ".jpg|png"|head -n1)
            imageurl=${${imageurl#*href=\"}%%\"*}
            ;;
        www.youtube.com|youtu.be)
            videourl=$1;;
    esac
    if [[ -n $url ]];then
        vr PASTIE $url
    elif [[ -n $imageurl ]];then
        (( $+commands[feh] )) && feh $imageurl || $BROWSER $imageurl
    elif [[ -n $videourl ]];then
         (( $+commands[youtube-viewer] )) && youtube-viewer -mplayer=$YOUTUBEPLAYER -mplayer_arguments=$YOUTUBEARGS $1 || $BROWSER "$1"
    else
        $BROWSER "$1"
    fi
}
vr(){
    curl -s -o "${ZURLDIR%/}/$val" $2
    testopen
    if [[ $? -eq 0 ]];then
        testmulti 
        if [[ $? -eq 0 ]]; then
            $MULTIPLEXER ${=MULTIARGS[@]} "$PASTEEDITOR ${PASTEARGS[@]} ${ZURLDIR%/}/$val"
        else
            (( $+commands[pasteterminal] )) && $pasteterminal ${=termexec[@]} zsh -c "$PASTEEDITOR ${PASTEARGS[@]} ${ZURLDIR%/}/$val" || $BROWSER $2
        fi
    else
        (( $+commands[$PASTEDITOR] )) && $PASTEEDITOR ${=OPENEDPASTEARGS[@]} ${ZURLDIR%/}/$val || $BROWSER $2
    fi
}
removefile (){
    sleep 1
    [[ -f ${ZURLDIR%/}/$val ]] && rm ${ZURLDIR%/}/$val
}
testopen(){
    if [[ -n ${(Mf)$(vim --serverlist)#PASTIE} ]];then
        return 1
    else
        return 0
    fi
}
testmulti(){
    if (( $+commands[tmux] )) && [[ -n ${(Mf)$(tmux list-session 2>&/dev/null|grep attached)} ]];then
        return 1
    else
        return 0
    fi
}

_zurl(){
    export val=$RANDOM
    while [[ -f ${ZURLDIR%/}/$val ]];do
        export val=$RANDOM
    done


    [[ -f /etc/zurlrc ]] && . /etc/zurlrc
    [[ -f ~/.zurlrc ]] && . ~/.zurlrc
    [[ -f $XDG_CONFIG_HOME/zurl/config ]] && . $XDG_CONFIG_HOME/zurl/config
    export AURLINKS=${AURLINKS:-PKGBUILD}
    export BROWSER=${BROWSER:-firefox}
    export GIFPLAYER=${GIFPLAYER:-mplayer}
    export YOUTUBEPLAYER=${YOUTUBEPLAYER:-mplayer}
    export PASTEEDITOR=${PASTEBINEDITOR:-vim}
    export MULTIPLEXER=${MULTIPLEXER:-tmux}
    export SERVERNAME=${SERVERNAME:-PASTIE}
    export ZURLDIR=${ZURLDIR:-/tmp}
    export REMOVEFILE=${REMOVEFILE:-1}
    export pasteterminal=${pasteterminal:-urxvt}
    [[ -z $termexec && $pasteterminal == "urxvt" ]] && export termexec="-e"
    [[ -z $GIFARGS ]] && export GIFARGS="-loop 0 -speed 1"
    [[ -z $YOUTUBEARGS ]] && export YOUTUBEARGS="-loop 0 -speed 1"
    [[ -z $PASTEARGS ]] && export PASTEARGS="--servername PASTIE"
    [[ -z $OPENEDPASTEARGS ]] && export OPENEDPASTEARGS="$PASTEARGS --remote-tab-silent"
    [[ -z $MULTIARGS ]] && export MULTIARGS="neww -n $SERVERNAME"


    filetype2="$(curl -I $1 2>& /dev/null |grep \^Content-Type|sed -e 'sT.*:\ \(.*/.*\);\?\ \?.*T\1Tg' )"
    filetype2=${filetype2%%;*}
    filetypeis=${filetype2%/*}
    case $filetypeis in 
        image)
            case ${filetype2#*/} in
                gif*)
                    file=/tmp/${${1##*/}%\.}
                    curl -s $1 -o $file
                    (( $+commands[$GIFPLAYER] )) && $GIFPLAYER ${=GIFARGS[@]} $file || $BROWSER $1
                    rm $file
                        ;;
                *)
                    curl -s -o ${ZURLDIR%/}/$val $1
                    (( $+commands[$IMAGEOPENER] )) && $IMAGEOPENER ${ZURLDIR%/}/$val || $BROWSER $1
                    ;;
            esac
            ;;
        *)
            if [[ $filetype2 == "text/plain" ]];then
                url=$1
                if [[ "${${1##*//}%%/*}" == "pastebin.com" ]];then
                    url=${${url//\?/\\\?}//=/\\=}
                fi
                vr PASTIE $url
            else
                pastebin $1
            fi
            ;;
    esac

    [[ $REMOVEFILE -eq 1 ]] && (removefile &>/dev/null &)
}
[[ ! -o login ]] && _zurl $*
# vim: set filetype=zsh:
