pkgname=lib32-qxorm
_pkgname=QxOrm
pkgver=1.2.4
pkgrel=1
pkgdesc="QxOrm C++ library, provides Object Relational Mapping (ORM) feature in C++. (32-bit libraries)"
arch=('x86_64')
url="http://www.qxorm.com/"
license=('LGPL')
depends=('boost' 'lib32-boost-libs' 'lib32-qt')
makedepends=('gcc-multilib' 'qt' 'boost')
source=(http://www.qxorm.com/version/${_pkgname}_${pkgver}.zip)
sha1sums=('2a7e0c6e9e7c69468e46682a3df14dc039b1c6f9')

build() {
  cd "${startdir}/src/${_pkgname}"

  #this lib is not available als debug version in archlinux, so fix the linking.
  sed -i 's/boost_serialization-mt/boost_serialization/g' "${startdir}/src/${_pkgname}/QxOrm.pri" 
  sed -i 's/boost_serialization-d/boost_serialization/g' "${startdir}/src/${_pkgname}/QxOrm.pri" 

  qmake -spec linux-g++-32 QxOrm.pro
  make release
}

package() {
  mkdir -p "${startdir}/pkg/usr"
  cp -a "${startdir}/src/${_pkgname}/lib" "${startdir}/pkg/usr/lib32"
}

