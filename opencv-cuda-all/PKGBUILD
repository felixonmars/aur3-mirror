# $Id: PKGBUILD 219332 2014-08-05 15:46:33Z schiv $
# Maintainer: Ray Rashif <schiv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgbase=opencv-cuda-all
pkgname=('opencv-cuda-all' 'opencv-cuda-samples')
pkgver=2.4.9
pkgrel=3
pkgdesc="Open Source Computer Vision Library (Built with Cuda)"
arch=('i686' 'x86_64')
license=('BSD')
url="http://opencv.org/"
depends=('gstreamer0.10-base' 'intel-tbb' 'openexr' 'cuda6'
         'xine-lib' 'libdc1394' 'gtkglext')
makedepends=('cmake' 'python2-numpy' 'mesa' 'eigen2' 'opencl-headers')
optdepends=('opencv-cuda-samples'
            'eigen2'
            'libcl: For coding with OpenCL'
            'python2-numpy: Python 2.x interface')
source=("http://downloads.sourceforge.net/opencvlibrary/opencv-$pkgver.zip"
        'pkgconfig.patch'
        'fsh.patch')
md5sums=('7f958389e71c77abdf5efe1da988b80c'
         'c7cea48ed7d4f729ebdb9673bac41bd3'
         'c597598d142dd34d0eb4af7d6e9779d8')
provides=('opencv' 'opencv-samples')

_cmakeopts=(
            '-D WITH_OPENCL=ON'
            '-D WITH_OPENGL=ON'
            '-D WITH_TBB=ON'
            '-D WITH_XINE=ON'
            '-D BUILD_WITH_DEBUG_INFO=OFF'
            '-D BUILD_TESTS=OFF'
            '-D BUILD_PERF_TESTS=OFF'
            '-D BUILD_EXAMPLES=ON'
            '-D INSTALL_C_EXAMPLES=ON'
            '-D INSTALL_PYTHON_EXAMPLES=ON'
            '-D CMAKE_BUILD_TYPE=Release'
            '-D CMAKE_INSTALL_PREFIX=/usr'
            '-D CMAKE_SKIP_RPATH=ON'
            '-D WITH_CUDA=ON'
            '-D CUDA_TOOLKIT_ROOT_DIR=/opt/cuda/'
            )

# SSE only available from Pentium 3 onwards (i686 is way older)
#[[ "$CARCH" = 'i686' ]] && \
#  _cmakeopts+=('-D ENABLE_SSE=OFF'
#               '-D ENABLE_SSE2=OFF'
#               '-D ENABLE_SSE3=OFF')

# all x64 CPUs support SSE2 but not SSE3
[[ "$CARCH" = 'x86_64' ]] && _cmakeopts+=('-D ENABLE_SSE3=OFF')

prepare() {
  cd "$srcdir/opencv-$pkgver"

  msg2 "Fixing broken pkg-config (downstream)"
  # see https://bugs.archlinux.org/task/32430
  # and http://code.opencv.org/issues/1925
  patch -Np1 -i "$srcdir/pkgconfig.patch"

  # TODO: this is mostly upstream frei0r; they hardcode the path
  #msg2 "Hack-fixing folder naming inconsistency (downstream)"
  # see http://code.opencv.org/issues/2512
  # and https://bugs.archlinux.org/task/32342
  #patch -Np1 -i "$srcdir/fsh.patch"

  # no longer including docs, see https://bugs.archlinux.org/task/34185
  # python2 compatibility for generating (html) docs
  #sed -i 's/sphinx-build/sphinx-build2/' cmake/OpenCVDetectPython.cmake
}

build() {
  cd "$srcdir/opencv-$pkgver"

  cmake ${_cmakeopts[@]} .

  make
}

package_opencv-cuda-all() {
  options=('staticlibs')

  cd "$srcdir/opencv-$pkgver"

  make DESTDIR="$pkgdir" install

  # install license file
  install -Dm644 "$srcdir/opencv-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/opencv/LICENSE"

  cd "$pkgdir/usr/share"

  # separate samples package; also be -R friendly
  if [[ -d OpenCV/samples ]]; then
    mv OpenCV/samples "$srcdir/opencv-cuda-samples"
    mv OpenCV opencv # otherwise folder naming is inconsistent
  elif [[ ! -d OpenCV ]]; then
    warning "Directory naming issue; samples package may not be built!"
  fi
}

package_opencv-cuda-samples() {
  pkgdesc+=" (samples)"
  depends=("opencv-cuda-all=$pkgver") # sample codes change with lib/API
  unset optdepends

  mkdir -p "$pkgdir/usr/share/opencv"
  cp -r "$srcdir/opencv-cuda-samples" "$pkgdir/usr/share/opencv/samples"

  # install license file
  #install -Dm644 "$srcdir/opencv-$pkgver/LICENSE" \
  #  "$pkgdir/usr/share/licenses/opencv/LICENSE"
}

# vim:set ts=2 sw=2 et:
