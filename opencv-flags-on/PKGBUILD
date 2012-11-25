# Maintainer: erwinkendo <erwinkendo@gmail.com>

pkgname=opencv-flags-on
_realname=OpenCV
pkgver=2.4.3
pkgrel=1
pkgdesc="Open Source Computer Vision Library. Stable Release + Several Compilation Flags (OpenNI+CUDA+TBB) + Samples and Docs"
url="http://opencv.org/"
license=("BSD")
arch=(i686 x86_64)
depends=('jasper' 'gstreamer0.10-base' 'openexr'
         'gtk2' 'xine-lib' 'libdc1394' 'v4l-utils' 'qt' 'bash' 'sensorkinect-git' 'cuda-toolkit' 'intel-tbb')
makedepends=('pkg-config' 'cmake' 'python2-numpy' 'python2-sphinx' 'doxygen' 'subversion' 'python2')
optdepends=('eigen'
            'eigen2'
            'python2-numpy: Python 2.x interface')
conflicts=('opencv-svn' 'opencv' 'opencv-docs' 'opencv-samples')
provides=('opencv' 'opencv-docs' 'opencv-samples')
options=('!libtool')

source=("http://downloads.sourceforge.net/opencvlibrary/$_realname-${pkgver}.tar.bz2"
        'pkgconfig.patch')
md5sums=('c0a5af4ff9d0d540684c0bf00ef35dbe'
         'd9d006d95b56a47ea3c2d77a5911e2ab')

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
            '-D WITH_QT_OPENGL=ON'
            '-D WITH_UNICAP=OFF'
            '-D WITH_PVAPI=OFF'
            '-D WITH_OPENNI=ON'
            '-D WITH_TBB=ON'
            '-D WITH_IPP=OFF'
            '-D WITH_CUDA=OFF'
            '-D USE_FAST_MATH=ON')

build() {

  # Basic build process
  cd "$srcdir/$_realname-$pkgver"

  # fix pkg-config mess
  # see https://bugs.archlinux.org/task/32430
  patch -Np1 -i "$srcdir/pkgconfig.patch"
  
  # GCC4.7 related fixes for CUDA compilation
  sed -i '1 i #undef _GLIBCXX_ATOMIC_BUILTINS' modules/gpu/src/nvidia/core/*.cu
  sed -i '1 i #undef _GLIBCXX_USE_INT128' modules/gpu/src/nvidia/core/*.cu

  sed -i '1 i #undef _GLIBCXX_ATOMIC_BUILTINS' modules/gpu/src/cuda/*.cu
  sed -i '1 i #undef _GLIBCXX_USE_INT128' modules/gpu/src/cuda/*.cu
  
  sed -i '1 i #undef _GLIBCXX_ATOMIC_BUILTINS' modules/gpu/src/nvidia/NPP_staging/*.cu
  sed -i '1 i #undef _GLIBCXX_USE_INT128' modules/gpu/src/nvidia/NPP_staging/*.cu
  
  sed -i '1 i #undef _GLIBCXX_ATOMIC_BUILTINS' modules/gpu/src/nvidia/*.cu
  sed -i '1 i #undef _GLIBCXX_USE_INT128' modules/gpu/src/nvidia/*.cu
  
  # x64, i.e "Athlon64" and upwards, can use SSE3
  [ $CARCH = x86_64 ] && \
    _cmakeopts=${_cmakeopts[@]/ENABLE_SSE3=OFF/ENABLE_SSE3=ON}

  cmake ${_cmakeopts[@]} .

  make
  
  # Package opencv libs: same as package_opencv()
  cd "$srcdir/$_realname-$pkgver"

  make DESTDIR="$pkgdir" install

  # install license file
  install -Dm644 "$srcdir/$_realname-$pkgver/doc/license.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "$pkgdir/usr/share"
  
  # separate docs package; also be -R friendly
  [ -d $_realname/doc ] && mv $_realname/doc "$srcdir/opencv-doc"

  # separate samples package
  [ -d $_realname/samples ] && mv $_realname/samples "$srcdir/opencv-samples"
  
  # Package opencv docs: same as package_opencv-docs()
  cd "$srcdir"

  mkdir -p "$pkgdir/usr/share/doc"
  cp -r opencv-doc "$pkgdir/usr/share/doc/$_realname"

  # install license file
  install -Dm644 "$srcdir/$_realname-$pkgver/doc/license.txt" \
  "$pkgdir/usr/share/licenses/$_realname/LICENSE"
    
  # Package opencv samples: same as package_opencv-docs()
  mkdir -p "$pkgdir/usr/share/$_realname"
  cp -r opencv-samples "$pkgdir/usr/share/$_realname/samples"

  # install license file
  install -Dm644 "$srcdir/$_realname-$pkgver/doc/license.txt" \
  "$pkgdir/usr/share/licenses/$_realname/LICENSE"
    
}