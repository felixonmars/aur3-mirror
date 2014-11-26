pkgname=agda-stdlib
pkgver=0.9
pkgrel=1
pkgdesc="The Agda standard library"
url="http://wiki.portal.chalmers.se/agda/pmwiki.php?n=Libraries.StandardLibrary"
license=("OtherLicense")
arch=('i686' 'x86_64')
makedepends=('ghc')
depends=()
source=("https://github.com/agda/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('923b487876235863e4f778aa40c508984b26636d50d531f0f31ca9dc45ab3717')
install="${pkgname}.install"

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/src
  install -d ${pkgdir}/usr/lib/${pkgname}
  cp -r * ${pkgdir}/usr/lib/${pkgname}
}
