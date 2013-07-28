# Maintainer: Jacob Grevald <archpkg@jacobgrevald.dk>

pkgname=silverstripe-framework
pkgver=3.0.5
pkgrel=2
pkgdesc="An object-oriented PHP5 web application framework"
arch=('any')
url="http://www.silverstripe.org"
license=('BSD')
depends=('php>=5.3.2')
optdepends=(
  'silverstripe-cms: CMS integration'
)
options=('!strip')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/silverstripe/silverstripe-installer/archive/${pkgver}.tar.gz"
	"silverstripe-installer-${pkgver}.tar.gz::https://github.com/silverstripe/${pkgname}/archive/${pkgver}.tar.gz"
        "lighttpd.example.conf")
md5sums=('d05fe833c72831047dea0495e7254e10'
         'a9c4bdf8dd04ba325c4a4d2ea73ce239'
         '30405058d0307d7e7a692d1dc97c5a1e')

package() {
  mkdir -p ${pkgdir}/etc/webapps/silverstripe/
  mkdir -p ${pkgdir}/usr/share/webapps/

  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/
  cd ${srcdir}/${pkgname}-${pkgver}
  sed -n '/Copyright/,/ DAMAGE./p' README.md > ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
 
  cd ${srcdir}/silverstripe-installer-${pkgver}
  mv mysite mysite-new
  mv themes themes-new

  cd ${pkgdir}/usr/share/webapps/
  cp -Ra ${srcdir}/silverstripe-installer-${pkgver} silverstripe
  cp -Ra ${srcdir}/${pkgname}-${pkgver} silverstripe/framework

  cp ${srcdir}/lighttpd.example.conf ${pkgdir}/etc/webapps/silverstripe/lighttpd.example.conf
}
