pkgname=fpc-x86_64-win64-rtl
pkgver=2.6.4
pkgrel=1
pkgdesc="Free Pascal runtime library for Win64."
arch=(any)
url="http://www.freepascal.org"
license=("GPL" "LGPL" "custom")
makedepends=("fpc=$pkgver" mingw-w64-binutils)
[ "$CARCH" = "i686" ] && makedepends=("ppcrossx64=$pkgver")
[ "$CARCH" = "i686" ] && makedepends=("ppcrossx64=$pkgver")
options=(!strip !makeflags !buildflags staticlibs)
source=("http://downloads.sourceforge.net/freepascal/fpcbuild-$pkgver.tar.gz")
md5sums=('403da132aed194fd841d46c3b33b022a')

build() {
  cd "${srcdir}/fpcbuild-$pkgver/fpcsrc/compiler"
  fpcmake -Tall
  cd ../..
  make NOGDB=1 build OS_TARGET=win64 CPU_TARGET=x86_64
}

package() {
  cd "${srcdir}/fpcbuild-$pkgver"
  make NOGDB=1 PREFIX="${pkgdir}/usr" crossinstall OS_TARGET=win64 CPU_TARGET=x86_64
  rm -rf "${pkgdir}/usr/bin"
  rm "$pkgdir/usr/lib/fpc/$pkgver/ppcrossx64"
  find $pkgdir -name '*.o' -o -name '*.a' | xargs -rtl1 x86_64-w64-mingw32-strip -g
}
