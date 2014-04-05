pkgname=mingw-w64-wavpack
pkgver=4.70.0
pkgrel=1
pkgdesc="Audio compression format with lossless, lossy and hybrid compression modes (mingw-w64)"
arch=(any)
license=('BSD')
url="http://www.wavpack.com/"

options=('!strip' '!buildflags' 'staticlibs')
depends=(mingw-w64-crt)
makedepends=(mingw-w64-gcc)

source=(http://www.wavpack.com/wavpack-${pkgver}.tar.bz2)
sha256sums=('2cade379b0aba99fbc4e442ccc6dac6c609f6212e46516a083e24c8c364430a4')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


build() {
  cd ${srcdir}/wavpack-${pkgver}
  
  export CFLAGS="-O2 -pipe -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  export CXXFLAGS="$CFLAGS"
  unset LDFLAGS
  
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ../configure --prefix=/usr/${_arch} \
      --host=${_arch} --build="$CHOST" \
      --enable-static --enable-shared \
      --enable-mmx --libdir=/usr/$_arch/lib
    make
    popd
  done
}


package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/wavpack-${pkgver}/build-${_arch}
    make DESTDIR="${pkgdir}" install
    
    find "$pkgdir" -name '*.exe' -delete
    find "$pkgdir" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir" -name '*.dll' -o -name '*.a' -exec ${_arch}-strip -g {} \;
    
    rm -rf ${pkgdir}/usr/${_arch}/share/{doc,info,man}
  done
}
