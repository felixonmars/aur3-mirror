# $Id: PKGBUILD 72637 2010-03-19 02:59:39Z allan $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: mupuf <martin.peres@ensi-bourges.fr>

pkgname=mpfr2
pkgver=2.4.2
pkgrel=2
pkgdesc="Multiple-precision floating-point library (shared object only)"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://www.mpfr.org/"
depends=('gmp>=5.0')
options=('!libtool')
install=mpfr.install
source=(http://www.mpfr.org/mpfr-2.4.2/mpfr-${pkgver}.tar.bz2)
md5sums=('89e59fe665e2b3ad44a6789f40b059a0')

build() {
  cd "${srcdir}/mpfr-${pkgver}"
  ./configure --prefix=/usr --enable-thread-safe --enable-shared || return 1
  make || return 1
  #make check || return 1
  make DESTDIR="${pkgdir}" install || return 1

  rm "${pkgdir}/usr/share" -r
  rm "${pkgdir}/usr/include" -r
  rm "${pkgdir}/usr/lib/libmpfr.a"
  rm "${pkgdir}/usr/lib/libmpfr.so"
}
