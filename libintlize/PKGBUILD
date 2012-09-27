# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=libintlize
pkgver=1.0.2
pkgrel=1
pkgdesc="A C and C++ runtime interface for the intlize native format."
arch=(i686 x86_64)
url="http://intlize.sourceforge.net/"
license=('custom:BSD')
makedepends=('libtool')
options=('!libtool')
source=("http://downloads.sourceforge.net/project/intlize/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('a144933f6ac6f578c079e52fcfcd5bc5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  # license
  install -Dm644 COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
