#!/bin/bash

if [ -e /sys/fs/cgroup/systemd ]; then
    case "$2" in
        up)
            systemctl start autofs.service
        ;;
        down)
            systemctl stop autofs.service
        ;;
        esac
elif [ -e "/etc/rc.d/autofs" ]; then
    case "$2" in
        up)
            rc.d start autofs
        ;;
        down)
            rc.d stop autofs
        ;;
    esac
fi
