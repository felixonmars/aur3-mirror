# Maintainer: edubart <edub4rt@gmail.com>
pkgname=mingw-w64-gperftools-git
pkgver=20140404
pkgrel=12
pkgdesc="Fast, multi-threaded malloc() and nifty performance analysis tools (mingw-w64)"
arch=(any)
url="http://code.google.com/p/gperftools/"
license=('BSD')
depends=('perl' 'mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=(!strip !buildflags staticlibs)
source=("git+https://code.google.com/p/gperftools/")
md5sums=('SKIP')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd $srcdir/gperftools
  ./autogen.sh
  for _arch in ${_architectures}; do
    mkdir -p $srcdir/gperftools/build-${_arch}
    cd $srcdir/gperftools/build-${_arch}
    ${_arch}-configure --enable-frame-pointers
    cp src/config.h ../src/
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd $srcdir/gperftools/build-${_arch}
    make DESTDIR="$pkgdir" install
    # we don't want to strip symbols
  done
}

# vim:set ts=2 sw=2 et: