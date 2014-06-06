#!/bin/sh

if which xmessage >> /dev/null 2>&1; then
    xmessage -buttons reboot,halt "$@" "";

    case "$?" in
        101)
            /usr/bin/systemctl reboot
            ;;
        102)
            /usr/bin/systemctl poweroff
            ;;
    esac
fi

