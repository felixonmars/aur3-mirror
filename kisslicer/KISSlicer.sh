#!/bin/bash
if [ -f _materials.ini ] || \
    [ -f _printers.ini ] || \
    [ -f _styles.ini ]   || \
    [ -f _supports.ini ]
then
    ln -s /usr/bin/kisslicer.bin ./kisslicer.tmp.bin
    ./kisslicer.tmp.bin $@
    rm ./kisslicer.tmp.bin
else
    mkdir -p "$HOME/.KISSlicer"
    cd "$HOME/.KISSlicer"
    if ! [ -s "$HOME/.KISSlicer/KISSlicer" ] ; then
        [[ -e "$HOME/.KISSlicer/KISSlicer" ]] && rm "$HOME/.KISSlicer/KISSlicer"
        ln -s /usr/bin/kisslicer.bin "$HOME/.KISSlicer/KISSlicer"
    fi
    ./KISSlicer $@
    rm ./KISSlicer
fi
