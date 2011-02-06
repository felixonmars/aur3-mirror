# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=glest-it
pkgver=3.1.0
pkgrel=1
pkgdesc="Italian language pack for Glest"
arch=('any')
url="http://www.glest.org"
license=('GPL')
depends=('glest')
source=(http://www.glest.org/files/contrib/translations/italian_${pkgver}.zip)
md5sums=('f11bbae0468d32fb845660b6dc8e4856')

build() {
  cd ${srcdir}
  install -D -m 644 *.lng "${pkgdir}/opt/glest/data/lang/italian.lng" || return 1
}
