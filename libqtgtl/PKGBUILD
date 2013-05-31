#Maintainer: Christer Stenbrenden <christer.stenbrenden@gmail.com>

pkgname=libqtgtl
pkgver=0.9.3
pkgrel=1
pkgdesc="Qt bindings to OpenGTL"
url="http://www.opengtl.org"
arch=('i686' 'x86_64')
depends=('qt4' 'llvm' 'opengtl')
license=('GPL')
makedepends=('cmake') 
source=(http://download.opengtl.org/libQtGTL-${pkgver}.tar.bz2)
md5sums=('1e9fd96332db22da01ab6d83568e396e')

build() {
  cd $srcdir
  if [[ -d ${srcdir}/build ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf ${srcdir}/build
  fi
  mkdir build
  cd $srcdir/build
  cmake $srcdir/libQtGTL-${pkgver} -DCMAKE_INSTALL_PREFIX=/usr
  make 
}
package() {
  cd $srcdir/build
  make DESTDIR=${pkgdir} install
  rm -r $srcdir/build
}
