#!/bin/bash

now=`date +"%Y%m%d_%Hh%m"`

case "$1" in
    stop)
        mkdir -p /logs_backup/$now
        cp -Rp /var/log/* /logs_backup/$now/
    ;;
    start)
    ;;
    *)
        echo 'Usage: /etc/init.d/console-setup {start||stop}'
        exit 1
   ;;
esac
