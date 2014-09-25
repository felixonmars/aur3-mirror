#!/bin/bash

post_install(){
  systemctl daemon-reload
  echo "[+] Please change user and display in /lib/systemd/system/batteryd.service"
  echo "[+] Please enable batteryd with 'systemctl enable batteryd.service'"
  echo "[+] You can activate it with 'systemctl start batteryd.service'"
}

pre_remove(){
  systemctl stop batteryd
  systemctl disable batteryd
}
