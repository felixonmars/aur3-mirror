#!/bin/sh
LC_COLLATE=ru_RU.utf8

## You have to set $browser variable. It will be used for opening urls
browser=ff

file=$1
mode=$2
linkid=${3:-1}

# The $regex will be used for finding usrls in message log
regex='(http|https|ftp)\://([a-zA-Z0-9\.\-]+\.[a-zA-Z]{2,4}|[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})(:[a-zA-Z0-9]*)?/?([а-яА-Яa-zA-Z0-9\._\?\,\\x27/\\\+&%\$#\=~!\-])*'

#if [ "$mode" = "number" ]; then
#    cat $file | grep -E -o $regex | \
#    grep -v 'http\://juick.com/[0-9]*' | tail --lines=$linkid | \
#    if read url; then
#        ff $url
#    fi
#else
    cat $file | grep -E -o $regex | \
    grep $linkid | tail --lines=1 | \
    if read url; then
        $browser $url &
    fi
#fi
