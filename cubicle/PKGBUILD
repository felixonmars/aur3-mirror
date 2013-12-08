# Maintainer: Basile Clement <basile@clement.pm>

pkgname=cubicle
pkgver=0.5
pkgrel=1
pkgdesc="An open source model checker for verifying safety properties of array-based systems"
arch=('i686' 'x86_64')
url="http://cubicle.lri.fr/"
license=('Apache')
source=("http://cubicle.lri.fr/cubicle-${pkgver}.tar.gz")
md5sums=('2831f3d8d3427ce965fff889997146de')
depends=('glibc' 'ocaml' 'functory')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
