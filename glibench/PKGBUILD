# Contributor: Stefan Lohmaier <noneuss at gmail dot com>
# Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=glibench
pkgver=0.5
pkgrel=2
pkgdesc="An SMP enabled benchmark for testing you computers performance."
arch=(i686)
url="http://glibench.sourceforge.net/"
license=('GPL')
depends=(gtk2)
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('f4b1dd8f3c34f5f8180c32c0991e7054')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make 
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
