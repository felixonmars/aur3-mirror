pkgname=qxorm
_pkgname=QxOrm
pkgver=1.2.6
pkgrel=2
pkgdesc="QxOrm C++ library, provides Object Relational Mapping (ORM) feature in C++. Includes debug version."
arch=('i686' 'x86_64')
url="http://www.qxorm.com/"
license=('GPL3')
depends=(boost-libs qt4)
source=(http://www.qxorm.com/version/${_pkgname}_${pkgver}.zip)
md5sums=('SKIP')


build() {
  cd "${startdir}/src/${_pkgname}"

  #this lib is not available als debug version in archlinux, so fix the linking.
  sed -i 's/boost_serialization-mt-d/boost_serialization/g' "${startdir}/src/${_pkgname}/QxOrm.pri"
  sed -e 's/boost_serialization-mt-d/boost_serialization/g' \
  -e 's/boost_serialization-mt/boost_serialization/g' \
  -i "${startdir}/src/${_pkgname}/QxOrm.pri"
  sed -i "s?/usr/local?${pkgdir}/usr?g" "${startdir}/src/${_pkgname}/QxOrm.pro" # zhenya_k

  qmake QxOrm.pro
  make release
  make release-install
  make debug
  make debug-install
  mkdir -p "${startdir}/pkg/usr"
  cp -r "${startdir}/src/${_pkgname}/lib" "${startdir}/pkg/usr"
  cp -r "${startdir}/src/${_pkgname}/include" "${startdir}/pkg/usr"
  cp -r "${startdir}/src/${_pkgname}/inl" "${startdir}/pkg/usr"
}
