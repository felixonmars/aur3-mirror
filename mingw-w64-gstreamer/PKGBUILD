pkgname=mingw-w64-gstreamer
pkgver=1.4.5
pkgrel=1
pkgdesc="GStreamer Multimedia Framework (mingw-w64)"
arch=(any)
license=('LGPL')
url="http://gstreamer.freedesktop.org/"
 
options=('!strip' '!buildflags' 'staticlibs')
depends=(mingw-w64-{glib2,libxml2})
makedepends=(mingw-w64-configure bison flex python)
 
source=(${url}/src/gstreamer/gstreamer-${pkgver}.tar.xz)
 
sha256sums=('40801aa7f979024526258a0e94707ba42b8ab6f7d2206e56adbc4433155cb0ae')
 
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
 
 
build() {
  cd ${srcdir}/gstreamer-${pkgver}
  
  export CFLAGS="-O2 -pipe -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  export CXXFLAGS="$CFLAGS"
  unset LDFLAGS
  
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --with-package-origin="http://www.archlinux.org/" \
      --disable-examples --disable-benchmarks \
      --disable-tests
    make
    popd
  done
}
 
 
package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/gstreamer-${pkgver}/build-${_arch}
    make DESTDIR="${pkgdir}" install
    
    rm $pkgdir/usr/$_arch/lib/gstreamer-1.0/*.a
    rm $pkgdir/usr/$_arch/lib/gstreamer-1.0/*.la
    
    find "$pkgdir" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir" -name '*.dll' -o -name '*.a' -exec ${_arch}-strip -g {} \;
  done
}
