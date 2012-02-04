# Contributor: giniu <gginiu@gmail.com>
pkgname=sprng2
pkgver=2.0b
pkgrel=1
pkgdesc="Scalable Parallel Pseudo Random Number Generators Library, 2.0 API"
arch=('i686', 'x86_64')
url="http://sprng.cs.fsu.edu/"
license=('unknown')
depends=('gmp')
makedepends=('gcc-fortran')
source=(http://sprng.cs.fsu.edu/Version2.0/sprng${pkgver}.tar.gz
        gfortran.patch)
md5sums=('cf825f9333d07acdcaa599f29f281b8d'
         'c2a97fb0b46b189fb36d052ee03d20b4')

build() {
  cd "$srcdir/sprng2.0"
  patch -p0 < ../gfortran.patch
  MAKEFLAGS="" make src
  install -D -m644 lib/libsprng.a "${pkgdir}/usr/lib/libsprng.a" || return 1
  install -D -m644 include/interface.h "${pkgdir}/usr/include/interface.h" || return 1
  install -D -m644 include/sprng.h "${pkgdir}/usr/include/sprng.h" || return 1
  install -D -m644 include/sprng_f.h "${pkgdir}/usr/include/sprng_f.h" || return 1
}

# vim:set ts=2 sw=2 et:
