#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/vbox/vbox.cfg
. /etc/conf.d/vboxdrv

if [[ -n "$INSTALL_DIR" ]]; then
  VBOXMANAGE="$INSTALL_DIR/VBoxManage"
  BUILDVBOXDRV="$INSTALL_DIR/src/vboxhost/vboxdrv/build_in_tmp"
  BUILDVBOXNETFLT="$INSTALL_DIR/src/vboxhost/vboxnetflt/build_in_tmp"
  BUILDVBOXNETADP="$INSTALL_DIR/src/vboxhost/vboxnetadp/build_in_tmp"
else
  echo "Missing /etc/vbox/vbox.cfg"
  exit 0
fi

# detection of dkms (if not disabled)
if [[ "$DISABLE_DKMS" =~ [yY][eE][sS] ]]; then
  USE_DKMS=0
else
  which dkms &>/dev/null
  USE_DKMS=$((! $?))
fi

# STARTBUILD cannot be used with dkms
(( USE_DKMS == 1 )) && START_BUILD=no


load() {
  if [[ "$START_BUILD" =~ [yY][eE][sS] ]]; then
    # check if module exists
    c=$('find' "/lib/modules/$(uname -r)" -type f -regex '.*/vbox\(drv\|netadp\|netflt\).ko' | wc -l)
    ((c == 0 )) && setup
  fi
  stat_busy "Loading VirtualBox kernel modules"
  # trivial loading
  for module in vbox{drv,netadp,netflt}; do
      modprobe $module &>/dev/null
  done
  # check
  for module in vbox{drv,netadp,netflt}; do
    if ! grep -q "^${module}" /proc/modules; then
      stat_fail
      return 1
    fi
  done
  add_daemon vboxdrv
  stat_done
}

unload() {
  stat_busy "Unloading VirtualBox kernel modules"
  # trivial unload
  for module in vbox{netflt,netadp,drv}; do
    if grep -q "^${module}" /proc/modules; then
      modprobe -r $module &>/dev/null
    fi
  done
  # check
  for module in vbox{drv,netadp,netflt}; do
    if grep -q "^${module}" /proc/modules; then
      stat_fail
      return 1
    fi
  done
  rm_daemon vboxdrv
  stat_done
}

remove() {
  if (( USE_DKMS == 1 )); then
    status "Removing VirtualBox kernel modules with DKMS" dkms remove -m vboxhost -v "$INSTALL_VER" --all
  else
    stat_busy "Removing VirtualBox kernel modules"
    find "/lib/modules/$(uname -r)" -type f -regex '.*/vbox\(drv\|netadp\|netflt\).ko' -delete
    stat_done
  fi
}

setup() {
  if (( USE_DKMS == 1 )); then
    status "Adding VirtualBox kernel modules in DKMS" dkms add -m vboxhost -v "$INSTALL_VER"
    status "Bulding VirtualBox kernel modules with DKMS" dkms build -m vboxhost -v "$INSTALL_VER"
    status "Installing VirtualBox kernel modules with DKMS" dkms install -m vboxhost -v "$INSTALL_VER"
  else
    remove
    stat_busy "Compiling VirtualBox kernel modules"
    LOG="/tmp/vbox-install.log"
    if ! $BUILDVBOXDRV \
      --save-module-symvers /tmp/vboxdrv-Module.symvers \
      --no-print-directory install > $LOG 2>&1; then
      echo  "Look at $LOG to find out what went wrong"
    fi
    if ! $BUILDVBOXNETFLT \
      --use-module-symvers /tmp/vboxdrv-Module.symvers \
      --no-print-directory install >> $LOG 2>&1; then
      echo "Look at $LOG to find out what went wrong"
    fi
    if ! $BUILDVBOXNETADP \
      --use-module-symvers /tmp/vboxdrv-Module.symvers \
      --no-print-directory install >> $LOG 2>&1; then
      echo "Look at $LOG to find out what went wrong"
    fi
    depmod -A
    stat_done
fi
}

fixusb() {
  # Build our device tree
  for i in /sys/bus/usb/devices/*; do
    if test -r "$i/dev"; then
      dev="`cat "$i/dev" 2> /dev/null`"
      major="`expr "$dev" : '\(.*\):' 2> /dev/null`"
      minor="`expr "$dev" : '.*:\(.*\)' 2> /dev/null`"
      class="`cat $i/bDeviceClass 2> /dev/null`"
      sh "$INSTALL_DIR/VBoxCreateUSBNode.sh" "$major" "$minor" "$class" 2>/dev/null
    fi
  done
}

case "$1" in
  start)
    load
    ;;
  stop)
      unload
      ;;
  restart)
      unload
      load
      ;;
  setup)
    setup
    ;;
  remove)
    remove
    ;;
  fixusb)
    fixusb
    ;;
  *)
    echo "usage: $0 {start|stop|restart|setup|remove|fixusb}"
esac

# vim:set ts=2 sw=2 ft=sh et:
