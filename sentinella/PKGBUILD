# Maintainer: Dany Martineau <dany.luc.martineau@gmail.com>
pkgname=sentinella
pkgver=0.9.1
pkgrel=1
pkgdesc="Desktop application that watches your system activity and, in consequence, takes an action that you've chosen."
url="http://sentinella.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('libsysactivity' 'kdebase-runtime')
makedepends=('cmake' 'hicolor-icon-theme' 'kdebase-workspace' 'automoc4')
install=sentinella.install
source=(http://downloads.sourceforge.net/${pkgname}/sentinella-${pkgver}.tar.gz)
md5sums=('5ce329ff5edf9066fe02ecd26b907feb')

build() {

  cd ${srcdir}
  if [[ -d ${srcdir}/build ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf ${srcdir}/build 
  fi
  mkdir ${srcdir}/build
  cd ${srcdir}/build 
  cmake ${srcdir}/${pkgname}-${pkgver} -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}
package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
