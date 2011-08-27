#!/bin/sh

[ "$#" != "4" ] && echo "Usage: $0 facebook_email facebook_password google_email google_password" && exit 1

facebook-list-friends "$1" "$2" | while read line; do google-contacts-add "$3" "$4" -n "$(echo $line | cut -d';' -f1)" -p "$(echo $line | cut -d';' -f2)" -g "$(echo $line | cut -d';' -f3)" -b "$(echo $line | cut -d';' -f4)" -e "$(echo $line | cut -d';' -f5)"; done
