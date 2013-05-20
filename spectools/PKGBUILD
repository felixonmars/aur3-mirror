# Maintainer: Tom Wambold <tom5760@gmail.com>
pkgname=spectools
pkgver=2011_08_R1
pkgrel=1
pkgdesc='A set of utilities for using various spectrum analyzer hardware.'
arch=('i686' 'x86_64')
url='http://www.kismetwireless.net/spectools/'
license=('GPL2')
depends=('libusb-compat' 'gtk2')
source=("http://www.kismetwireless.net/code/$pkgname-2011-08-R1.tar.gz")
md5sums=('b742d5c7dec6fbd3c5070e54d43e6570')

build() {
  cd "$srcdir/$pkgname-2011-08-R1"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-2011-08-R1"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
