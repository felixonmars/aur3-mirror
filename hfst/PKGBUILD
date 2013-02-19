# Maintainer: Filip Graliński <filipg@amu.edu.pl>
pkgname=hfst
pkgver=3.4.3
pkgrel=2
pkgdesc='Helsinki Finite-State Transducer Technology (HFST) tools'
arch=('i686' 'x86_64')
url='http://www.ling.helsinki.fi/kieliteknologia/tutkimus/hfst/'
license=('LGPL')
makedepends=(automake autoconf libtool flex bison gcc)
depends=(gcc-libs libxml2 bash)
install=
source=(http://downloads.sourceforge.net/project/hfst/hfst/hfst-${pkgver}.tar.gz)
md5sums=('c9b65637e3e5a1a6f26529d2fdaf3a6d')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  ./configure --prefix=/usr

  make || return 1
}

package () {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR=${pkgdir} make install || return 1
  rm ${pkgdir}/usr/bin/hfst-sfstpl2fst
  rm ${pkgdir}/usr/lib/libhfst.la
}
