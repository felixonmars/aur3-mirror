# Maintainer: thiagoc <root@thiagoc.net>
pkgname=openr2
pkgver=1.3.1
pkgrel=1
pkgdesc="Library that implements the MFC/R2 telephony signaling protocol over E1 lines"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.libopenr2.org/"
source=("http://openr2.googlecode.com/files/openr2-$pkgver.tar.gz")
md5sums=('3468fab4a8bf5759ab5a8e2bdb6539b4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make CFLAGS="$CFLAGS -Wno-error"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
