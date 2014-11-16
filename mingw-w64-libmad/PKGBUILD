pkgname=mingw-w64-libmad
pkgver=0.15.1b
pkgrel=5
pkgdesc="A high-quality MPEG audio decoder (mingw-w64)"
arch=(any)
url="http://www.underbit.com/products/mad"
license=("GPL")
depends=(mingw-w64-crt)
makedepends=(mingw-w64-configure)
options=(staticlibs !strip !buildflags)
source=("http://downloads.sourceforge.net/mad/libmad/${pkgver}/libmad-${pkgver}.tar.gz"
        "optimize.diff"
        "frame_length.diff"
        "libmad.patch")
md5sums=('1be543bc30c56fb6bea1d7bf6a64e66c'
         '787115a740a7b2675acb385cf2f11f6a'
         '3329b032118a68e18908197e65b3198d'
         'fbcca0267a423bae45389666f4cb04d5')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir/libmad-$pkgver"
  rm -f mad.pc.in
  patch -p1 -i "${srcdir}"/libmad.patch
  patch -p1 -i "${srcdir}"/frame_length.diff
  patch -p1 -i "${srcdir}"/optimize.diff

  # fix mad.pc rule in previous patch
  sed -i "s|AC_CONFIG_FILES(\[Makefile msvc++\/Makefile|AC_CONFIG_FILES(\[Makefile msvc++\/Makefile mad.pc|g" configure.ac

  # fix undefined symbols
  sed -i "s|libmad_la_LDFLAGS =|libmad_la_LDFLAGS = -no-undefined|g" Makefile.am

  # autoconf errors about these
  touch NEWS AUTHORS ChangeLog
  autoreconf -sfi
}

build() {
  cd "$srcdir/libmad-$pkgver"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --disable-dependency-tracking \
      --enable-accuracy \
      --disable-debugging
    make
    popd
  done 
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libmad-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
