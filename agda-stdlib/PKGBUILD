pkgname=agda-stdlib
pkgver=0.8.1
pkgrel=1
pkgdesc="The Agda standard library"
url="http://wiki.portal.chalmers.se/agda/pmwiki.php?n=Libraries.StandardLibrary"
license=("OtherLicense")
arch=('i686' 'x86_64')
makedepends=('ghc')
depends=()
source=("https://github.com/agda/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ee11ba4579f2b6b590660d469885636d086beb7a0589676300f88249c9cb4446')
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
