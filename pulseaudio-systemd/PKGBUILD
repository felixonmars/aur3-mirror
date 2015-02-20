# Maintainer: Dmitry Fillo <fillo at fillo dot me>
# Contributor: Joseph Lehner <joseph.c.lehner@gmail.com>

pkgname=pulseaudio-systemd
pkgver=1.1
pkgrel=1
epoch=
depends=(pulseaudio)
pkgdesc='A systemd service for running PulseAudio in system-wide mode'
arch=(any)
url='http://www.freedesktop.org/wiki/Software/PulseAudio/Documentation/User/WhatIsWrongWithSystemWide'
license=('GPL')
install=install
source=(pulseaudio.service pulseaudio-system-wide.conf)
md5sums=('2c5e2bf4d5d45cec9cc73de842243d29'
         'f182541bba87a6499110443ef2aa00b5')

package() {
  install -m 644 -D pulseaudio.service "$pkgdir/"usr/lib/systemd/system/pulseaudio.service
  install -m 644 -D pulseaudio-system-wide.conf "$pkgdir/"etc/dbus-1/system.d/pulseaudio-system-wide.conf
}
