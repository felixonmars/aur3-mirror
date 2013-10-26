# Maintainer: Mark Bruggemann <mark.bruggemann AT gmail>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: mickele <mimocciola AT yahoo DOT com>
# Contributor: Christoph Siegenthaler <csi AT gmx DOT ch>

pkgname=getdp
pkgver=2.4.2
pkgrel=1
pkgdesc="A general finite element solver using mixed elements to discretize de Rham-type complexes in one, two and three dimensions"
arch=('i686' 'x86_64')
url="http://www.geuz.org/getdp/"
license=('GPL')
depends=('arpack' 'gsl' 'petsc' 'slepc')
makedepends=('gcc-fortran' 'cmake')
source=("http://www.geuz.org/getdp/src/${pkgname}-${pkgver}-source.tgz")
md5sums=('bf094244db2094f60276d28dd4c46089')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-source"
  mkdir build && cd build

  cmake .. -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-source/build"

  make bindir="${pkgdir}/usr/bin" \
       mandir="${pkgdir}/usr/share/man" install
}
