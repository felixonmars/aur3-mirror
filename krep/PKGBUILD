# Maintainer: Nicky726 (Nicky726 <at> gmail <dot> com)

pkgname=krep
pkgver=0.82
pkgrel=1
pkgdesc="KDE text file viewer with filtering possibilities"
arch=('i686' 'x86_64')
url="ihttp://staerk.de/thorsten/Krep"
license=('GPL')
depends=('kdelibs')
makedepends=('svn')
source=()
md5sums=()

build() {
  cd "${srcdir}"
  # Apparently there is nowhere an up-to-date tarball, 
  # get the code from svn for now.
  svn co svn://anonsvn.kde.org/home/kde/trunk/playground/utils/krep/
  cd "${pkgname}"
  cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" -DLIB_INSTALL_DIR=/usr/lib
  make
}

package(){
  cd "${srcdir}/${pkgname}"
  make install
}
