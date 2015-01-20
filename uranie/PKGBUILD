pkgname=uranie
pkgver=3.6.0
pkgrel=1
pkgdesc="Sensitivity and uncertainty analysis plateform based on the ROOT framework"
license=('LGPL')
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/uranie/"
depends=('root5' 'nlopt' 'optpp' 'libpcl' 'fftw' 'libxml2' 'minuit2' 'python2')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/uranie/URANIE-${pkgver}-Source.tar.gz")
md5sums=('b5fc407f02930b117ab3a13715e3b204')

prepare() {
  cd "${srcdir}/URANIE-${pkgver}-Source"

  sed -i 's|SET(ROOT_MAX_VERSION "5.34/24")|SET(ROOT_MAX_VERSION "5.34/25")|g' CmakePackage/FindROOT.cmake

  # hardwired too...
  sed -i "s|COMMAND python|COMMAND \${PYTHON_EXECUTABLE}|g" CmakePackage/UraniePython.cmake
}

build() {
  cd "${srcdir}/URANIE-${pkgver}-Source"

  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFFTW_LIBRARIES=/usr/lib/libfftw3.so \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 . 
  make
}

package() {
  cd "${srcdir}/URANIE-${pkgver}-Source"
  make DESTDIR="$pkgdir" install
  install -d "$pkgdir"/usr/lib/python2.7/site-packages
  mv "$pkgdir"/usr/lib/python/URANIE "$pkgdir"/usr/lib/python2.7/site-packages
  rm "$pkgdir"/usr/uranie*
}

