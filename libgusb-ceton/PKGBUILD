# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=libgusb-ceton
_origpkgname=libgusb
pkgver=0.1.4
pkgrel=1
pkgdesc="GLib wrapper around libusb1 custom version for Ceton's tuning adapter driver"
arch=('i686' 'x86_64')
url="https://gitorious.org/gusb/"
license=('LGPL2.1')
source=(http://cetoncorp.com/downloads//$_origpkgname-$pkgver.tar.xz)
options=('!libtool')
sha256sums=('2ae9a79f5a706ccf1e63bed4a140dbccdaa920f48e1571396c277d1a8de92794')
conflicts=('libgusb')
provides=('libgusb')

build() {
  cd "$srcdir/$_origpkgname-$pkgver"
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "$srcdir/$_origpkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
