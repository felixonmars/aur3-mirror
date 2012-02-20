# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>

pkgname=mingw32-gmp
pkgver=5.0.4
pkgrel=1
arch=('any')
pkgdesc="A free library for arbitrary precision arithmetic (mingw32)"
depends=('mingw32-runtime')
makedepends=('mingw32-gcc')
options=(!strip !buildflags !libtool)
license=('LGPL3')
url="http://gmplib.org/"
source=(ftp://ftp.gnu.org/gnu/gmp/gmp-${pkgver}.tar.bz2)
sha256sums=('35d4aade3e4bdf0915c944599b10d23f108ffedf6c3188aeec52221c5cf9a06f')


build() {
  cd "${srcdir}/${pkgname#mingw32-}-${pkgver}"

  export ABI="32"

  ./configure \
    --prefix=/usr/i486-mingw32 \
    --target=i486-mingw32 \
    --host=i486-mingw32 \
    --build=${CHOST} \
    --enable-cxx

  make
}

package() {
  cd "${srcdir}/${pkgname#mingw32-}-${pkgver}"

  make install DESTDIR="$pkgdir/"

  find "$pkgdir/" -name '*.a' | xargs -rtl1 i486-mingw32-strip -g
}

# vim:set ts=2 sw=2 et:
