# $Id$
# Maintainer: Blind <x15@gmx.net>
pkgname=buttons-eee901
pkgver=0.5
pkgrel=1
pkgdesc="Eee 901 button driver"
arch=(i686)
license=('GPL2')
url="http://no.idea.yet"
backup=()
depends=('dbus-python' 'hal' 'alsa-utils')
replaces=()
provides=()
install=
source=('buttons-eee901.py'
        '30-keymap-eeepc.fdi')
md5sums=()

build() {
  install -D -m644 30-keymap-eeepc.fdi ${pkgdir}/etc/hal/fdi/information/10freedesktop/30-keymap-eeepc.fdi
  install -D -m755 buttons-eee901.py ${pkgdir}/usr/bin/buttons-eee901.py
}
