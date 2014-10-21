# Maintainer: Philipp Menken <ahbrosha@posteo.de>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>


pkgbase=opencv-cuda-qt
pkgname=('opencv-cuda-qt')
pkgver=2.4.10
provides=('opencv=$pkgver' 'opencv-samples')
pkgrel=5
pkgdesc="Open Source Computer Vision Library with CUDA and QT5 support. SSE4.1 is enabled."
arch=('i686' 'x86_64')
license=('BSD')
url="http://opencv.org/"
conflicts=('opencv' 'opencv-samples')
depends=('intel-tbb' 'openexr' 'xine-lib' 'libdc1394' 'gtkglext' 'cuda' 'qt5-base' 'gstreamer' 'ffmpeg')
makedepends=('cmake' 'python2-numpy' 'mesa' 'eigen2' 'v4l-utils')
optdepends=('eigen2'
            'libcl: For coding with OpenCL'
            'python2-numpy: Python 2.x interface')
source=("http://downloads.sourceforge.net/opencvlibrary/opencv-$pkgver.zip"
	'pkgconfig-cuda32.patch'
	'pkgconfig-cuda64.patch')

md5sums=('ec63952d3a3dff965d5fdde765926821'
	 '85eba7635880fe6c45828e8684ef47e0'
	 '766954b1451898f8a274903aa46d6388')

_cmakeopts=('-D WITH_OPENCL=ON'
            '-D WITH_OPENGL=ON'
            '-D WITH_TBB=ON'
            '-D WITH_XINE=ON'
            '-D WITH_GSTREAMER=ON'
	    '-D WITH_FFMPEG=ON'
            '-D WITH_CUDA=ON'
	    '-D CUDA_TOOLKIT_ROOT_DIR=/opt/cuda/'
            '-D WITH_QT=ON'
            '-D BUILD_WITH_DEBUG_INFO=OFF'
            '-D BUILD_TESTS=OFF'
            '-D BUILD_PERF_TESTS=OFF'
            '-D BUILD_EXAMPLES=ON'
            '-D INSTALL_C_EXAMPLES=ON'
            '-D INSTALL_PYTHON_EXAMPLES=ON'
            '-D CMAKE_BUILD_TYPE=Release'
            '-D CMAKE_INSTALL_PREFIX=/usr'
            '-D CMAKE_SKIP_RPATH=ON'
            '-D ENABLE_SSE3=ON'
            '-D ENABLE_SSE41=ON' #May not supported by your CPU
            )


prepare() {
  cd "$srcdir/opencv-$pkgver"

  msg2 "Fixing broken pkg-config (downstream)"
  # see https://bugs.archlinux.org/task/32430
  # and http://code.opencv.org/issues/1925

  # Patching pkg-config for 32bit installations
  msg2 "Patching pkg-config for CUDA support"
  [[ "$CARCH" = 'i686' ]] && \
    patch -Np1 -i "$srcdir/pkgconfig-cuda32.patch"


  # Patching pkg-config for 64bit installations
  [[ "$CARCH" = 'x86_64' ]] && \
    patch -Np1 -i "$srcdir/pkgconfig-cuda64.patch"
}

build() {
  cd "$srcdir/opencv-$pkgver"

  cmake ${_cmakeopts[@]} .

  make
}

package_opencv-cuda-qt() {
  options=('staticlibs')

  cd "$srcdir/opencv-$pkgver"

  make DESTDIR="$pkgdir" install

  # install license file
  install -Dm644 "$srcdir/opencv-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/opencv/LICENSE"
}
