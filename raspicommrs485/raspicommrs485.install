#!/bin/bash

# unload the supplied module if it's currently loaded
function unload_module() {
  local s=`lsmod | grep ${1}`
  if [ "$s" != "" ]; then
    echo "unloading module $1"
    rmmod ${1}
  fi
}

post_install() {

  # update modprobe dependency list
  depmod /lib/modules/$(uname -r)/raspicommrs485.ko

  # inform the user that the kernel module was installed
  echo "installed kernel module 'raspicommrs485'"
  echo ""
  echo "consider creating a file '/etc/modules-load.d/raspicommrs485.conf'"
  echo "with the content 'raspicommrs485' which will load the module on startup"
  echo "e.g. by executing 'echo raspicommrs485 >> /etc/modules-load.d/raspicommrs485.conf'"
  echo ""
  echo "you can now load the module using 'modprobe raspicommrs485'"
  echo ""
}

pre_remove() {

  # unload the module
  unload_module raspicommrs485;
}

post_remove() {

  # update modprobe dependency list
  depmod -a

  # inform the user that the startup file is obsolete now
  if [[ -e "/etc/modules-load.d/raspicommrs485.conf" ]]; then
    echo "consider removing the configuration file /etc/modules-load.d/raspicommrs485.conf"
    echo ""
  fi
}