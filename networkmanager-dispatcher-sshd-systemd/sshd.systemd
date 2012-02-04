#!/bin/bash

if [ "$(systemctl is-enabled sshd.service)" == "enabled" ]; then
  case "${2}" in
    up|vpn-up)
      systemctl start sshd.service
      ;;
    down|vpn-down)
      systemctl stop sshd.service
      ;;
  esac
fi
