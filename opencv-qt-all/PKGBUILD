# $Id: PKGBUILD 144087 2011-12-03 09:31:31Z schiv $
# Maintainer: Ray Rashif <schiv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=('opencv-qt-all')
_realname=OpenCV
pkgver=2.4.4a
_realver=2.4.4
pkgrel=1
pkgdesc="Open Source Computer Vision Library. Build with Qt backend, python bindings and full examples."
arch=('i686' 'x86_64')
license=('BSD')
url="http://opencv.willowgarage.com/"
depends=('jasper' 'gstreamer0.10-base' 'openexr'
         'gtk2' 'xine-lib' 'v4l-utils' 'qt4' 'bash')
makedepends=('pkg-config' 'cmake' 'python2-numpy' 'eigen2')
optdepends=(
            'eigen2'
            'python2-numpy: Python 2.x interface')
conflicts=('opencv' 'opencv-docs' 'opencv-samples')
provides=('opencv' 'opencv-docs' 'opencv-samples')
options=('!libtool')
source=("http://downloads.sourceforge.net/opencvlibrary/$_realname-${pkgver}.tar.bz2")
md5sums=('876dce80ea2648b7e4d4c5a567b4d37b')

_cmakeopts=('-D CMAKE_BUILD_TYPE=Release'
            '-D CMAKE_INSTALL_PREFIX=/usr'
            '-D PYTHON_EXECUTABLE=/usr/bin/python2'
            '-D CMAKE_SKIP_RPATH=ON'
            '-D BUILD_TESTS=OFF'
            '-D ENABLE_SSE=ON'
            '-D ENABLE_SSE2=ON'
            '-D ENABLE_SSE3=ON'
            '-D ENABLE_SSSE3=ON'
            '-D ENABLE_SSE41=ON'
            '-D ENABLE_SSE42=ON'
            '-D BUILD_EXAMPLES=ON'
            '-D INSTALL_C_EXAMPLES=ON'
            '-D INSTALL_PYTHON_EXAMPLES=ON'
            '-D WITH_XINE=ON'
            '-D WITH_QT=ON'
            '-D WITH_QT_OPENGL=OFF'
            '-D WITH_UNICAP=OFF'
            '-D WITH_PVAPI=OFF'
            '-D WITH_OPENNI=OFF'
            '-D WITH_TBB=OFF'
            '-D WITH_IPP=OFF'
            '-D WITH_CUDA=OFF'
            '-D USE_FAST_MATH=ON')

build() {
  REAL_SRC_DIR="$srcdir/opencv-$_realver"
  cd "$REAL_SRC_DIR"

  # x64, i.e "Athlon64" and upwards, can use SSE3
  [ $CARCH = x86_64 ] && \
    _cmakeopts=${_cmakeopts[@]/ENABLE_SSE3=OFF/ENABLE_SSE3=ON}

  cmake ${_cmakeopts[@]} .

  make

  cd "$REAL_SRC_DIR"

  make DESTDIR="$pkgdir" install

  # install license file
  install -Dm644 "$REAL_SRC_DIR/doc/license.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "$pkgdir/usr/share"

  # prepare FSH-friendly dirs
  if [ -d OpenCV ]; then
    cp -ra OpenCV/* opencv
    rm -r OpenCV
  fi

  cp $REAL_SRC_DIR/samples/{python,python2} "$pkgdir/usr/share/opencv/samples/" -r

  ## separate docs package; also be -R friendly
  #[ -d opencv/doc ] && mv opencv/doc "$srcdir/opencv-doc"

  ## separate samples package
  #[ -d opencv/samples ] && mv opencv/samples "$srcdir/opencv-samples"
}

# vim:set ts=2 sw=2 et:
