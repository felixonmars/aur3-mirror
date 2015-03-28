# Maintainer: Giuseppe Borzi <gborzi _AT_ ieee _DOT_ org>
pkgname=openblas-st
_pkgname=OpenBLAS
pkgver=0.2.14
pkgrel=1
pkgdesc="A single-threaded optimized BLAS library based on GotoBLAS2 1.13 BSD "
arch=('i686' 'x86_64')
url="http://www.openblas.net/"
license=('BSD')
depends=('gcc-libs')
makedepends=('perl' 'gcc-fortran')
options=(!makeflags !emptydirs)
source=(${_pkgname}-v${pkgver}.tar.gz::http://github.com/xianyi/OpenBLAS/archive/v${pkgver}.tar.gz)
md5sums=('53cda7f420e1ba0ea55de536b24c9701')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  unset CFLAGS
  unset CXXFLAGS
  make USE_THREAD=0 NO_LAPACK=1 LIBPREFIX=lib$pkgname
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make PREFIX="$pkgdir/usr" USE_THREAD=0 LIBPREFIX=lib$pkgname install
  rm -f "$pkgdir/usr/include/cblas.h" "$pkgdir"/usr/include/lapacke*
  mkdir "$pkgdir/usr/include/$pkgname"
  mv $pkgdir/usr/include/*.h "$pkgdir/usr/include/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd "$pkgdir/usr/lib/"
  ln -sf libopenblas-st_*-r$pkgver.a libopenblas-st.a
  ln -sf libopenblas-st_*-r$pkgver.so libopenblas-st.so
  ln -sf libopenblas-st_*-r$pkgver.so libopenblas-st.so.0
  mv "$pkgdir/usr/lib/cmake/openblas/OpenBLASConfig.cmake" "$pkgdir/usr/lib/cmake/openblas/OpenBLASSTConfig.cmake"
  sed -i -e "s%$pkgdir%%" "$pkgdir/usr/lib/cmake/openblas/OpenBLASSTConfig.cmake"
  sed -i -e "s/OpenBLAS_/OpenBLASST_/" "$pkgdir/usr/lib/cmake/openblas/OpenBLASSTConfig.cmake"
  sed -i -e "s_/usr/include_&/openblas-st_" "$pkgdir/usr/lib/cmake/openblas/OpenBLASSTConfig.cmake"
}

# vim:set ts=2 sw=2 et:
