
pkgname=mingw-w64-ode
pkgver=0.13
pkgrel=2
pkgdesc="An open source, high performance library for simulating rigid body dynamics (mingw-w64)"
arch=(any)
url="http://www.ode.org"
license=("BSD, LGPL")
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!strip' '!buildflags')
source=("http://downloads.sourceforge.net/sourceforge/opende/ode-${pkgver}.tar.bz2")
md5sums=('04b32c9645c147e18caff7a597a19f84')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/ode-${pkgver}"
  # missing space if we set CFLAGS
  sed -i "s|CXXFLAGS+=\"\-mthreads \$CXXFLAGS\"|CXXFLAGS+=\"\ -mthreads \$CXXFLAGS\"|g" ou/configure
}

build() {
  cd "${srcdir}/ode-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --enable-double-precision \
      --enable-libccd
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/ode-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
