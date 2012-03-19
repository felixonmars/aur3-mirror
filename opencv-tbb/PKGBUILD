# $Id: PKGBUILD 88973 2010-08-27 12:02:00Z schiv $
# Maintainer: Ray Rashif <schiv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=opencv-tbb
_pybin=python2
_pydir=python2.7
pkgver=2.3.1
_pkgver=${pkgver}a
pkgrel=1
pkgdesc="Intel(R) Open Source Computer Vision Library with Threading Building Blocks and SSE3"
arch=('i686' 'x86_64')
license=('BSD')
url="http://opencv.willowgarage.com"
depends=('jasper' 'python2-numpy' 'eigen' 'gstreamer0.10-base' 'openexr' 'gtk2' 'xine-lib' 'libdc1394' 'v4l-utils' 'intel-tbb')
makedepends=('pkg-config' 'cmake')
options=('!libtool')
provides=('opencv')
conflicts=('opencv')
source=(http://downloads.sourceforge.net/opencvlibrary/OpenCV-${_pkgver}.tar.bz2)
md5sums=('82e4b6bfa349777233eea09b075e931e' )
build() {
  cd "$srcdir/OpenCV-$pkgver"

  export CXXFLAGS="$CXXFLAGS -D__STDC_CONSTANT_MACROS"

  cmake . -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_SKIP_RPATH=ON \
          -DWITH_XINE=ON \
          -DWITH_UNICAP=OFF \
          -DPYTHON_EXECUTABLE=/usr/bin/$_pybin \
          -DPYTHON_INCLUDE_DIR=/usr/include/$_pydir \
	  -DWITH_TBB=ON \
	  -DWITH_TBB_INCLUDE_DIR=/usr/include/ \
	  -DWITH_TBB_LIB_DIR=/usr/lib \
	  -DPYTHON_LIBRARY=/usr/lib/lib$_pydir.so \
	  -DBUILD_EXAMPLES=YES \
	  -DINSTALL_C_EXAMPLES=YES \
	  -DINSTALL_PYTHON_EXAMPLES=YES           

  make
}

package() {
  cd "$srcdir/OpenCV-$pkgver"

  make DESTDIR="$pkgdir/" install

  # install license file
  install -Dm644 "$srcdir/OpenCV-$pkgver/doc/license.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
