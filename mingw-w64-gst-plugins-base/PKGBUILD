pkgname=mingw-w64-gst-plugins-base
pkgver=1.4.2
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Base Plugins (mingw-w64)"
arch=(any)
license=('LGPL')
url="http://gstreamer.freedesktop.org/"

options=('!strip' '!buildflags' 'staticlibs')
depends=(mingw-w64-gstreamer
         mingw-w64-libvorbis
         mingw-w64-libtheora)
makedepends=(mingw-w64-gcc python)

source=(${url}/src/gst-plugins-base/gst-plugins-base-${pkgver}.tar.xz)

sha256sums=('c0a8c44607d8a5669d2f0c118a72026f883a58ce1f3c720924b77f275b7b8835')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


build() {
  cd ${srcdir}/gst-plugins-base-${pkgver}
  
  export CFLAGS="-O2 -pipe -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  export CXXFLAGS="$CFLAGS"
  unset LDFLAGS
  
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ../configure \
      --prefix=/usr/${_arch} \
      --host=${_arch} --build="$CHOST" \
      --with-package-origin="http://www.archlinux.org/" \
      --enable-static --enable-shared \
      --disable-examples --disable-freetypetest \
      --disable-x --disable-xvideo --disable-xshm --disable-alsa
    make
    popd
  done
}


package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/gst-plugins-base-${pkgver}/build-${_arch}
    make DESTDIR="${pkgdir}" install
    
    rm $pkgdir/usr/$_arch/lib/gstreamer-1.0/*.a
    rm $pkgdir/usr/$_arch/lib/gstreamer-1.0/*.la
    
    find "$pkgdir" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir" -name '*.dll' -o -name '*.a' -exec ${_arch}-strip -g {} \;
  done
}
