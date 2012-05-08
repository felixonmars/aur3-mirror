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
    esac
    if [[ -n $url ]];then
        vr PASTIE $url
    elif [[ -n $imageurl ]];then
        (( $+commands[feh] )) && feh $imageurl || xdg-open $imageurl
    else
        xdg-open "$1"
    fi
}
vr(){
    if [[ -z ${(Mf)$(vim --serverlist)#$1} ]];then
        if (( $+commands[tmux] )) && [[ -n ${(Mf)$(tmux list-session)##*attached} ]];then
            tmux neww -n $1 "zsh -c 'vim \"+noremap q <esc>:q!<cr>\"  -c \":silent :r !curl -s $2 \" --servername $1 /tmp/${2##*[^0-9A-Za-z]}'"
        else
            urxvtc -e zsh -c "vim '+noremap q <esc>:q!<cr>'  -c ':silent :r !curl -s $2 2>&/dev/null' --servername $1 /tmp/${2##*[^0-9A-Za-z]}"
        fi
    else
        vim "+noremap q <esc>:q!<cr>" --servername $1  --remote-tab-silent  "+exec \":silent :r !curl -s $2 2 >& /dev/null\"" /tmp/${2##*[^0-9A-Za-z]}
        tmux selectw -t pastie
    fi
}
[[ -f ~/.zurlrc ]] && export ZURLCONFIG=$(awk '/auropens/ {print $2}' $HOME/.zurlrc) 
[[ -z ZURLCONFIG ]] && export ZURLCONFIG="PKGBUILD"
export AURLINKS=${AURLINKS:-$ZURLCONFIG}
export SPEED=${SPEED:-1.0}
filetype2="$(curl -I $1 2>& /dev/null |grep \^Content-Type|sed -e 'sT.*:\ \(.*/.*\);\?\ \?.*T\1Tg' )"
filetype2=${filetype2%%;*}
filetypeis=${filetype2%/*}
case $filetypeis in 
    image)
        case ${filetype2#*/} in
            gif*)
                curl $1 > /tmp/${1##*/} 2 >& /dev/null
                mplayer -loop 0 -speed $SPEED /tmp/${1##*/}
                rm /tmp/${1##*/}
                    ;;
            *)
                feh  $1
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
