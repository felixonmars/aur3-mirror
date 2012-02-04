# Maintainer: kang <kang@insecure.ws>

pkgname=mingw32-gnutls
pkgver=2.10.4
pkgrel=1
pkgdesc="A TLS Library (mingw32)"
arch=('any')
license=('GPL')
makedepends=(mingw32-gcc libgcrypt)
url="http://ftp.gnu.org"
source=("ftp://ftp.gnu.org/gnu/gnutls/gnutls-${pkgver}.tar.bz2")
md5sums=('4e1517084018a8b1fdc96daabea40528')

build() {
  cd "$srcdir/gnutls-$pkgver"

  unset LDFLAGS
  ./configure --prefix=/usr/i486-mingw32 --host i486-mingw32
  make || return 1
  make install DESTDIR=$pkgdir || return 1
}

# vim:set ts=2 sw=2 et:
