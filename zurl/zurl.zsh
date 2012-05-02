#!/usr/bin/env zsh
pastebin() {
    case "${${1##*//}%%/*}" in
        sprunge.us)
            url="${1%\?*}"
            ;;
        raw.github.com|gist.github.com)
            [[ "${${1##*//}%%\.*}" == "gist" ]] && url="https://raw.github.com/gist/'${1##*/}'" || url="$1"
            ;;
        pastebin.com)
            url="http://pastebin.com/raw.php\?i\=${1##*/}"
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
        pastebin.ca|www.pastebin.ca)
            url="${1%/*}/raw/${1##*/}"
            ;;
        pastebin(\.centos)?\.org)
            url="${1%/*}/pastebin.php\?dl\=${1##*/}"
            ;;
        pastie.org)
            url="${1%/*}/pastes/${1##*/}/download"
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
                url=${(Mf)$( curl $1):#*PKGBUILD*}
                url=https://aur.archlinux.org/"${${url##*=\'}%\'*}"
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
            imageurl=$(curl $1 |grep -Ei ".jpg|png"|head -n1)
            imageurl=${${imageurl#*href=\"}%%\"*}
            ;;
    esac
    if [[ -n $url ]];then
        vr PASTIE $url
    elif [[ -n $imageurl ]];then
        feh $imageurl
    else
        firefox "$1"
    fi
}
vr(){
    echo $2
    if [[ -z ${(Mf)$(vim --serverlist)#$1} ]];then
        tmux neww -n pastie "zsh -c 'vim \"+noremap q <esc>:q!<cr>\"  -c \":r !curl -s $2\" --servername $1 /tmp/${2##*[^0-9A-Za-z]}'"
    else
        vim "+noremap q <esc>:q!<cr>" --servername $1  --remote-tab-silent  "+exec \":r !curl -s $2\"" /tmp/${2##*[^0-9A-Za-z]}
        tmux selectw -t pastie
    fi
}
filetype2="$(curl -I $1 2>& /dev/null |grep \^Content-Type|sed -e 'sT.*:\ \(.*/.*\);\?\ \?.*T\1Tg' )"
filetypeis=${filetype2%/*}
echo $filetype2
echo $filetypeis
case $filetypeis in 
    image)
        feh  $1
        ;;
    video)
        mplayer $1
        ;;
    *)
        if [[ $filetype2 == "text/plain" ]];then
            vr PASTIE $1
        else
            pastebin $1
        fi
        ;;
esac
