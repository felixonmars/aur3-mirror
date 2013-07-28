# Maintainer: Jacob Grevald <archpkg@jacobgrevald.dk>

pkgname=silverstripe-cms
pkgver=3.0.5
pkgrel=1
pkgdesc="PHP5 Content Management System (CMS)"
arch=('any')
url="http://www.silverstripe.org"
license=('BSD')
depends=('silverstripe-framework=3.0.5')
options=('!strip')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/silverstripe/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('e6956623209b1a04aa8b3547044338a2')

package() {
  mkdir -p ${pkgdir}/usr/share/webapps/silverstripe

  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cd ${srcdir}/${pkgname}-${pkgver}
  sed -n '/Copyright/,/ DAMAGE./p' README.md > ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  cd ${pkgdir}/usr/share/webapps/silverstripe
  cp -Ra ${srcdir}/${pkgname}-${pkgver} cms
}
