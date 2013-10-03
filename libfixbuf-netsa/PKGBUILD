# Maintainer: Dwight Beaver <dsbeav@gmail.com>
_origname=libfixbuf
pkgname=$_origname-netsa
pkgver=1.3.0
pkgrel=1
pkgdesc="Implementation of the IPFIX Protocol as a C library"
depends=(pcre)
arch=(i686 x86_64 armv6h)
url=http://tools.netsa.cert.org/fixbuf/
license=(LGPL)
source=(http://tools.netsa.cert.org/releases/$_origname-$pkgver.tar.gz)
md5sums=('f3a5da729b36fe7f90a9d432184a6d1c')

build() {
  cd "$srcdir/$_origname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$_origname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$_origname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
# vim:set ts=2 sw=2 et:

