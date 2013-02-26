pkgname=fpc-arm-wince-rtl
pkgver=2.6.2
pkgrel=1
pkgdesc="Free Pascal runtime library for Windows CE."
arch=(any)
url="http://www.freepascal.org"
license=("GPL" "LGPL" "custom")
depends=("fpc=$pkgver" arm-wince-binutils "ppcrossarm=$pkgver")
makedepends=(arm-wince-binutils "ppcrossarm=$pkgver")
options=(!buildflags !strip)
source=("ftp://ftp.freepascal.org/pub/fpc/dist/$pkgver/source/fpcbuild-$pkgver.tar.gz")
md5sums=('89c7e60db6280f3d5cc006a4a9ff43a9')

_optimal_make_jobs() {
  if [ -r /proc/cpuinfo ]; then
    local core_count=$(grep -Fc processor /proc/cpuinfo)
  else
    local core_count=0
  fi
  if [ $core_count -gt 1 ]; then
    echo -n $[$core_count-1]
  else
    echo -n 1
  fi
}

build() {
  cd "${srcdir}/fpcbuild-$pkgver/fpcsrc/compiler"
  fpcmake -Tall
  cd ../..
  make -j$(_optimal_make_jobs) NOGDB=1 build OS_TARGET=wince CPU_TARGET=arm
}

package() {
  cd "${srcdir}/fpcbuild-$pkgver"
  make NOGDB=1 PREFIX="${pkgdir}/usr" crossinstall OS_TARGET=wince CPU_TARGET=arm
  rm -r "${pkgdir}/usr/bin"
  rm "$pkgdir/usr/lib/fpc/$pkgver/ppcrossarm"
  find $pkgdir -name '*.o' -o -name '*.a' | xargs -rtl1 arm-wince-strip -g
}
