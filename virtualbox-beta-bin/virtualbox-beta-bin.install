#!/bin/bash

update_databases() {
  # Update mime database
  [[ -x /usr/bin/update-mime-database ]] &&
    /usr/bin/update-mime-database /usr/share/mime &>/dev/null

  # Update xdg icon database
  [[ -x /usr/bin/xdg-icon-resource ]] &&
    /usr/bin/xdg-icon-resource forceupdate --theme hicolor &>/dev/null

  # Update desktop database
  [[ -x /usr/bin/update-desktop-database ]] &&
    /usr/bin/update-desktop-database -q &>/dev/null
}

post_install() {
  # Add vboxusers group, GID 108 is reserved (http://wiki.archlinux.org/index.php/UID_and_GID_list),
  getent group vboxusers &> /dev/null || groupadd -f -g 108 vboxusers

  # Load new udev rule for module vboxdrv
  udevadm control --reload-rules

  # Update databases
  update_databases

  # Build new module
  #/etc/rc.d/vboxdrv setup

  # Show warnings
  /bin/cat <<EOF

==> Remember to add allowed users to the vboxusers group:
==> # gpasswd -a USERNAME vboxusers
==>
==> To load virtualbox modules automatically you can add vboxdrv in your DAEMONS
==> To start virtualbox web service automatically you can add vboxweb in your DAEMONS
==>
==> To fix missing usb devices, you can call rc.d fixusb vboxdrv or reboot your computer

EOF
}

pre_upgrade() {
  pre_remove

  # Remove any stuff remaining from the module compilation
  rm -Rf "/opt/VirtualBox"
}

post_upgrade() {
  post_install
}

pre_remove() {
  # Stop running services
  [[ -x /etc/rc.d/vboxdrv ]] && /etc/rc.d/vboxdrv stop
  [[ -x /etc/rc.d/vboxweb ]] && /etc/rc.d/vboxweb stop

  # Remove modules
  [[ -x /etc/rc.d/vboxdrv ]] && /etc/rc.d/vboxdrv remove
}

post_remove() {
  # Remove any stuff remaining from the module compilation
  rm -Rf "/opt/VirtualBox"

  # Remove any run files
  rm -Rf "/var/run/VirtualBox"

  # Update databases
  update_databases

  # remove vboxusers group
  groupdel vboxusers &>/dev/null || true
}

# vim:set ts=2 sw=2 ft=sh et:
