pkgname=fpc-i386-win32-rtl
pkgver=2.6.4
pkgrel=1
pkgdesc="Free Pascal runtime library for Win32."
arch=(any)
url="http://www.freepascal.org"
license=("GPL" "LGPL" "custom")
depends=("fpc=$pkgver")
makedepends=(ppcross386 mingw-w64-binutils)
options=(!strip !makeflags !buildflags staticlibs)
source=("ftp://ftp.freepascal.org/pub/fpc/dist/$pkgver/source/fpcbuild-$pkgver.tar.gz")
md5sums=('403da132aed194fd841d46c3b33b022a')

build() {
  cd "${srcdir}/fpcbuild-$pkgver/fpcsrc/compiler"
  fpcmake -Tall
  cd ../..
  make NOGDB=1 build OS_TARGET=win32 CPU_TARGET=i386
}

package() {
  cd "${srcdir}/fpcbuild-$pkgver"
  make NOGDB=1 PREFIX="${pkgdir}/usr" crossinstall OS_TARGET=win32 CPU_TARGET=i386
  rm -r "${pkgdir}/usr/bin"
  rm "$pkgdir/usr/lib/fpc/$pkgver/ppcross386"
  find $pkgdir -name '*.o' -o -name '*.a' | xargs i686-w64-mingw32-strip -g
}
