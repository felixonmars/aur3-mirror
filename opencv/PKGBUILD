# Maintainer: Matthieu Zimmer (contact@matthieu-zimmer.net)

pkgname=opencv-java-git
pkgbase=opencv
pkgver=2.4
pkgrel=3
pkgdesc="Open Source Computer Vision Library"
arch=('i686' 'x86_64')
license=('BSD')
url="http://opencv.org/"
depends=('intel-tbb' 'openexr' 'xine-lib' 'libdc1394' 'gtkglext')
makedepends=('cmake' 'python2-numpy' 'mesa' 'eigen2')

_cmakeopts=('-D BUILD_SHARED_LIBS=OFF'
            '-D WITH_TBB=ON'
            '-D WITH_GSTREAMER=OFF'
            '-D BUILD_WITH_DEBUG_INFO=OFF'
            '-D BUILD_TESTS=OFF'
            '-D BUILD_PERF_TESTS=OFF'
            '-D BUILD_EXAMPLES=OFF'
            '-D INSTALL_C_EXAMPLES=OFF'
            '-D INSTALL_PYTHON_EXAMPLES=OFF'
            '-D CMAKE_BUILD_TYPE=Release'
            '-D CMAKE_INSTALL_PREFIX=/usr/local'
            '-D CMAKE_SKIP_RPATH=ON')

# SSE only available from Pentium 3 onwards (i686 is way older)
[[ "$CARCH" = 'i686' ]] && \
  _cmakeopts+=('-D ENABLE_SSE=OFF'
               '-D ENABLE_SSE2=OFF'
               '-D ENABLE_SSE3=OFF')

# all x64 CPUs support SSE2 but not SSE3
[[ "$CARCH" = 'x86_64' ]] && _cmakeopts+=('-D ENABLE_SSE3=OFF')

prepare(){
  git clone git://github.com/Itseez/opencv.git
  cd opencv
  git checkout 2.4
}

build() {
  cd "$srcdir/$pkgbase"
  
  export JAVA_HOME="/usr/lib/jvm/$(archlinux-java get)"
  cmake ${_cmakeopts[@]} .

  make -j4
}

package() {
  options=('staticlibs')

  cd "$srcdir/$pkgbase"

  make DESTDIR="$pkgdir" install

  # install license file
  install -Dm644 "$srcdir/$pkgbase/LICENSE" \
    "$pkgdir/usr/local/share/licenses/$pkgbase/LICENSE"

  cd "$pkgdir/usr/local/share"
}

# vim:set ts=2 sw=2 et:
