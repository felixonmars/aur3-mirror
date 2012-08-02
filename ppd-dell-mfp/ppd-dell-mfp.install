#!/bin/bash

post_install() {
  echo -n "Restarting the CUPS daemon... "
  /etc/rc.d/cupsd restart > /dev/null && echo "done"

  echo "-----
Network printing with the mfp1135n does not seem to work over IPP or
LPD/LPR, though the device claims to support these
protocols. AppSocket / Jetdirect does work using a URL scheme like

    socket://192.168.1.30:9100
-----"
}

post_upgrade() {
  post_install
}

post_remove() {
  post_install
}
