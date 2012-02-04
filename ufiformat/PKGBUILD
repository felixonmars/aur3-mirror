# Maintainer: René Herman <rene dot herman at gmail dot com>

pkgname=ufiformat
pkgver=0.9.9
pkgrel=1
pkgdesc="Low-level formatting utility for USB floppy drives"
arch=('i686' 'x86_64')
url="http://www.geocities.jp/tedi_world/format_usbfdd_e.html"
license=('GPL')
depends=('e2fsprogs')
source=(http://www.geocities.jp/tedi_world/$pkgname-$pkgver.tar.gz)
md5sums=('18e41a189b81b1599a38ce8640698b7f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install || return 1
}

# vim:set ts=2 sw=2 et:
