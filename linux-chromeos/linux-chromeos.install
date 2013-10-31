#!/bin/sh

_note() {
  echo "NOTE: The kernel image has NOT been installed to a boot device"
  echo "To install the kernel, edit /boot/cmdline-linux-chromeos to at least"
  echo "include your root device, and run "
  echo "  # linux-chromeos-install DEVICE PARTITION PARTITION-NUMBER"
  echo "For example, to install to partition 3 on the first MMC device,"
  echo "  # linux-chromeos-install /dev/mmc0 /dev/mmc0p3 3"
}

post_install() {
  _note
}

post_upgrade() {
  _note
}
