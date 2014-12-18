#!/bin/bash
dir=$(mktemp -d)
file="$(tr -dc "[:alpha:]" < /dev/urandom | head -c 8).png"
import $dir/$file
libpushimg $dir/$file | xclip -selection c
notify-send "Pushimg" "Image uploaded successfully"
rm -R $dir
