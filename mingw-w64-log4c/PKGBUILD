
pkgname=mingw-w64-log4c
pkgver=1.2.4
pkgrel=2
pkgdesc="Logging FrameWork for C, as Log4j or Log4Cpp (mingw-w64)"
url="http://log4c.sourceforge.net/"
arch=(any)
license="LGPL"
depends=('mingw-w64-crt' 'mingw-w64-expat')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=(http://prdownloads.sourceforge.net/log4c/log4c-$pkgver.tar.gz)
sha256sums=('5991020192f52cc40fa852fbf6bbf5bd5db5d5d00aa9905c67f6f0eadeed48ea')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/log4c-$pkgver"
  # fails for x86_64-w64-mingw32
  sed -i "/#define alloca _alloca/d" src/sd/sd_xplatform.h
}

build() {
  cd "$srcdir/log4c-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/log4c-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm "$pkgdir"/usr/${_arch}/lib/*.def
    rm -r "$pkgdir"/usr/${_arch}/{etc,share}
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
