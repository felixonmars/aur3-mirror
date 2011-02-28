# Maintainer: Peter Marheine <peter[at]taricorp[dot]net>
pkgname=rx-flash-tool
pkgver=20110106
pkgrel=1
pkgdesc="Programming utilities for Renesas RX microcontrollers."

arch=('i686' 'x86_64')
depends=(libusb-compat)
url=("http://people.redhat.com/~dj/m32c/",
     "http://www.delorie.com/electronics/rx-stick/")
license=('GPL')
source=(http://people.redhat.com/~dj/m32c/flash-tool.tar.gz)
md5sums=('087dbb69892d08e32e913f75f7b5ee4b')


build() {
  cd $srcdir/
  make rxusb rxs
}

package() {
  mkdir -p $pkgdir/usr/bin
  install rxusb rxs $pkgdir/usr/bin
}

# vim:set ts=2 sw=2 et:
