# Maintainer: shacristo <shacristo at gmail dot com>

pkgname=mingw32-armadillo
_pkgname=armadillo
pkgver=1.1.4
pkgrel=1
pkgdesc="C++ linear algebra library (mingw32)"
arch=('i686' 'x86_64')
url="http://arma.sourceforge.net/"
license=('LGPL3')
depends=('mingw32-lapack' 'mingw32-blas' 'mingw32-boost')
makedepends=('cmake')
source=(http://downloads.sourceforge.net/sourceforge/arma/$_pkgname-$pkgver.tar.gz \
	toolchain)
md5sums=('862b1663335d9e2f1004f455ae56949d'
         'fa454184e9e8abe9b807bed3a29001e0')

build() {
  cd ${srcdir}/$_pkgname-$pkgver
  unset CFLAGS CXXFLAGS LDFLAGS
  cmake -DCMAKE_TOOLCHAIN_FILE=${srcdir}/toolchain . || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
