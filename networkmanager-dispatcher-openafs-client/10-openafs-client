#!/bin/bash

if [ -e /sys/fs/cgroup/systemd ]; then
        case "$2" in
                up)
                              systemctl start openafs-client.service
                ;;
                down)
                              systemctl stop openafs-client.service
                ;;
        esac
else
        if [ -e "/etc/rc.d/ntpd" ]; then
                case "$2" in
                        up)
                                rc.d start openafs-client
                        ;;
                        down)
                                rc.d stop openafs-client
                        ;;
                esac
        fi

fi
