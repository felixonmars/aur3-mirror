# PKGBUILD template to install Espresso 
# Maintainer: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>

pkgname=(votca-csg)
pkgver=1.2.3
pkgrel=1
pkgdesc="Versatile Object-oriented Toolkit for Coarse-graining Applications (VOTCA) is a package intended to reduce the amount of routine work when doing systematic coarse-graining of various systems."
url="http://www.votca.org/"
license=("Apache")
arch=(i686 x86_64)
depends=('python2' 'votca-tools' 'gromacs')
optdepends=('python2-espressopp')
makedepends=('cmake' 'doxygen')
source=(
https://votca.googlecode.com/files/${pkgname}-${pkgver}.tar.gz
)
md5sums=('06232fc09ecf3b1efd9c58fa11222cf7')

build() {

  msg2 "Fixing python2 invokation"
  cd ${srcdir}/${pkgname}-${pkgver}/share/scripts/inverse
  sed -i 1s/python2*/python2/ *.py

  msg2 "Building votca-tools"
  #Real Configuration
  mkdir -p ${srcdir}/build
  cd ${srcdir}/build
  cmake ../${pkgname}-${pkgver} \
         -DCMAKE_INSTALL_PREFIX=/usr \
         -DWITH_RC_FILES=OFF \
         -DEXTERNAL_BOOST=ON 
  make
}

package() {
  msg2 "Making executables"
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}

