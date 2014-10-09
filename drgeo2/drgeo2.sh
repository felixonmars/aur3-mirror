#!/bin/bash

DIR_LOCAL="$HOME/.drgeo"
DIR_SHARE="/usr/share/drgeo2"

# usage function
usage (){
    cat <<EOF
usage $0 options :

This script run drgeo2 after copying all needed files in \$HOME/.drgeo

OPTIONS :

-h : print this help
-c : remove all files in your $HOME/.drgeo directory
-f : do a clean start (same as a --clear start and a second one)
-p : launch drgeo2 with a new image file, change won't be saved

EOF
}

# launching function
launch (){
    cd "$DIR_LOCAL"
    VM="$DIR_LOCAL/Contents/Linux"
    RESOURCES="$DIR_LOCAL/Contents/Resources"
    image="$RESOURCES/drgeo.image"
    # icon (note: gvfs-set-attribute is found in gvfs-bin on Ubuntu
    # systems and it seems to require an absolute filename)
    gvfs-set-attribute \
    "$0" \
    "metadata::custom-icon" \
    "file://$RESOURCES/drgeo.png" \
    2> /dev/null   
    
    # execute
    "$VM/pharo" \
    --plugins "$VM" \
    --encoding utf-8 \
    -vm-display-X11 \
        -title "Dr. Geo" \
        "$image"   
}

pre-launch () {
    DIR_SHARE_RC="$DIR_SHARE/Contents/Resources"
    DIR_LOCAL_RC="$DIR_LOCAL/Contents/Resources"

    mkdir -p "$DIR_LOCAL/Contents"
    mkdir -p "$DIR_LOCAL/MyExports"
    mkdir -p "$DIR_LOCAL/MySketches"
    mkdir -p "$DIR_LOCAL_RC"
    
    [ -e "$DIR_LOCAL_RC/drgeo.image" ]   || cp "$DIR_SHARE_RC/drgeo.image"   "$DIR_LOCAL_RC/drgeo.image"
    [ -e "$DIR_LOCAL_RC/drgeo.changes" ] || cp "$DIR_SHARE_RC/drgeo.changes" "$DIR_LOCAL_RC/drgeo.changes"
    
    pushd "$DIR_SHARE_RC"
    for file in ./*; do
    [ -e "$DIR_LOCAL_RC/$file" ] || ln -s "$DIR_SHARE_RC/$file" "$DIR_LOCAL_RC/$file"
    done
    popd

    pwd
    [ -e "$DIR_LOCAL/splash.bmp" ]     || ln -s "$DIR_SHARE/splash.bmp"     "$DIR_LOCAL/splash.bmp"
    [ -e "$DIR_LOCAL/Contents/Linux" ] || ln -s "$DIR_SHARE/Contents/Linux" "$DIR_LOCAL/Contents/Linux"
    [ -e "$DIR_LOCAL/locale" ]         || ln -s "$DIR_SHARE/locale"         "$DIR_LOCAL/locale"
}

cleanup() {
    read -p "Do you really want to remove your $DIR_LOCAL directory ? (y/N)" -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -Rf "$DIR_LOCAL"
    else
        exit 1
    fi
}

if [ $# -eq 0 ]; then
    pre-launch
    launch
fi

while getopts "hcfp" opt;
do
    case "$opt" in
    h)
        usage
        exit 0
        ;;
    c)
        cleanup
        exit 0
        ;;
    f)
        cleanup
        pre-launch
        launch
        ;;
    p)
        DIR_LOCAL="/tmp/.drgeo"
        rm -Rf "$DIR_LOCAL"
        pre-launch
        launch
        rm -Rf "$DIR_LOCAL"
        ;;
    esac
done
