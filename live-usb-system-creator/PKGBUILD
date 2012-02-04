# Maintainer: Dan Serban
# Contributor: Todd Partridge (Gen2ly)

pkgname=live-usb-system-creator
pkgver=0.1.1
pkgrel=2
pkgdesc="Create a live/bootable USB from a Ubuntu CD/DVD ISO"
arch=(any)
url=https://launchpad.net/liveusb
license=(GPLv2)
depends=('gksu' 'libglade' 'python2' 'pygtk' 'syslinux' 'util-linux' 'dbus-python')
install='live-usb-system-creator.install'
source=(http://ppa.launchpad.net/probono/ubuntu/pool/main/l/liveusb/liveusb_${pkgver}.tar.gz)
md5sums=('ad845dddc933cb0771c369fd5bb0fafd')

build()
{
  # Automount bug, gnome-volume-manager is not needed anyway
  sed -i -e "s/    mgr = gnomeauto/#    mgr = gnomeauto/g" main/usr/share/python-support/liveusb/liveusb.py
  cd main
  mv usr "$pkgdir/"
  sed -i "s#/usr/bin/python #/usr/bin/python2 #" "$pkgdir/usr/bin/liveusb"
  sed -i "s|#![ ]*/usr/bin/env python$|#!/usr/bin/python2|" $(find $pkgdir -name '*.py')
}
