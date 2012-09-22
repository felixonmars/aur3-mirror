# $Id: PKGBUILD 70672 2012-05-14 16:07:52Z bluewind $
# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgbasename=gmp
pkgname=libx32-$_pkgbasename
pkgver=5.0.5
pkgrel=1.1
pkgdesc="A free library for arbitrary precision arithmetic (x32 ABI)"
arch=('x86_64')
url="http://gmplib.org/"
depends=('libx32-gcc-libs' $_pkgbasename)
makedepends=(gcc-multilib-x32)
license=('LGPL3')
options=(!libtool)
source=(
ftp://ftp.gnu.org/gnu/gmp/gmp-${pkgver}.tar.xz{,.sig}
gmp_fix_for_x32.patch
)
md5sums=('8aef50959acec2a1ad41d144ffe0f3b5'
         '406e8878aadc51b134d1b3dd845261ee'
         '5bd5304b7b245784ed0f713668269a17')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  patch -p1 -i ${srcdir}/gmp_fix_for_x32.patch

  autoconf

  export ABI=x32
  ./configure \
    --prefix=/usr --infodir=/usr/share/info \
    --enable-cxx --libdir=/usr/libx32 \
    --includedir=/usr/libx32/gmp

  #Put gmp.h in the same folder as gmpxx.h
  sed -i 's/$(exec_prefix)\/include/$\(includedir\)/' Makefile

  make
}

check() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
}
