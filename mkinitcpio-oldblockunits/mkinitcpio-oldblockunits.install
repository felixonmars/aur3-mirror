#!/bin/bash
pre_install() {
  rm -f /usr/lib/initcpio/install/fw
  rm -f /usr/lib/initcpio/install/sata
  rm -f /usr/lib/initcpio/install/pata
  rm -f /usr/lib/initcpio/install/scsi
  rm -f /usr/lib/initcpio/install/usb
  rm -f /usr/lib/initcpio/install/mmc
  rm -f /usr/lib/initcpio/install/virtio
}
post_install(){
  mv /usr/lib/initcpio/install/fw.new /usr/lib/initcpio/install/fw
  mv /usr/lib/initcpio/install/sata.new /usr/lib/initcpio/install/sata
  mv /usr/lib/initcpio/install/pata.new /usr/lib/initcpio/install/pata
  mv /usr/lib/initcpio/install/scsi.new /usr/lib/initcpio/install/scsi
  mv /usr/lib/initcpio/install/usb.new /usr/lib/initcpio/install/usb
  mv /usr/lib/initcpio/install/mmc.new /usr/lib/initcpio/install/mmc
  mv /usr/lib/initcpio/install/virtio.new /usr/lib/initcpio/install/virtio

}
pre_remove() {
  rm -f /usr/lib/initcpio/install/fw
  rm -f /usr/lib/initcpio/install/sata
  rm -f /usr/lib/initcpio/install/pata
  rm -f /usr/lib/initcpio/install/scsi
  rm -f /usr/lib/initcpio/install/usb
  rm -f /usr/lib/initcpio/install/mmc
  rm -f /usr/lib/initcpio/install/virtio
}

post_remove() {
  cd /usr/lib/initcpio/install
  ln -s block fw
  ln -s block sata
  ln -s block pata
  ln -s block scsi
  ln -s block usb
  ln -s block mmc
  ln -s block virtio
}
