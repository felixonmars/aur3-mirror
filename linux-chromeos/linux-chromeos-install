#!/bin/sh

usage() {
  echo "Usage: $(basename "$0") DEVICE PARTITION PARTITION-NUMBER"
}

main() {
  test $# -eq 3 || { usage; exit 1; }

  KERN_DEVICE=${1}
  KERN_PART=${2}
  KERN_PARTNUM=${3}

  vbutil_kernel --repack ${KERN_PART} \
                --version 1 \
                --arch arm \
                --oldblob /boot/packed-oem-linux-chromeos \
                --config /boot/cmdline-linux-chromeos \
                --keyblock /usr/share/vboot/devkeys/kernel.keyblock \
                --signprivate /usr/share/vboot/devkeys/kernel_data_key.vbprivk

  cgpt add -S 1 -i ${KERN_PARTNUM} ${KERN_DEVICE}
}

main "$@"
