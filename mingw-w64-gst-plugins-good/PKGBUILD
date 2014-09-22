pkgname=mingw-w64-gst-plugins-good
pkgver=1.4.2
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Good Plugins (mingw-w64)"
arch=(any)
license=('LGPL')
url="http://gstreamer.freedesktop.org/"

options=('!strip' '!buildflags' 'staticlibs')
depends=(mingw-w64-gstreamer mingw-w64-wavpack)
makedepends=(mingw-w64-gcc python)

source=(${url}/src/gst-plugins-good/gst-plugins-good-${pkgver}.tar.xz)

sha256sums=('63d7c8006af05143839b6e166a363d84c438380efe1409029deebcfce50b0fa8')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


build() {
  cd ${srcdir}/gst-plugins-good-${pkgver}
  
  export CFLAGS="-O2 -pipe -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  export CXXFLAGS="$CFLAGS"
  unset LDFLAGS
  
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ../configure --prefix=/usr/${_arch} \
      --host=${_arch} --build="$CHOST" \
      --enable-static --enable-shared \
      --disable-examples \
      --disable-oss --disable-oss4 --disable-sunaudio \
      --disable-osx_audio --disable-osx_video --disable-gst_v4l2 \
      --disable-x --disable-xshm --disable-xvideo --disable-pulse
    make
    popd
  done
}


package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/gst-plugins-good-${pkgver}/build-${_arch}
    make DESTDIR="${pkgdir}" install
    
    rm $pkgdir/usr/$_arch/lib/gstreamer-1.0/*.a
    rm $pkgdir/usr/$_arch/lib/gstreamer-1.0/*.la
    
    find "$pkgdir" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir" -name '*.dll' -o -name '*.a' -exec ${_arch}-strip -g {} \;
  done
}
