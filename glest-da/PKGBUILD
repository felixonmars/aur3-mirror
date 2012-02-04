# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=glest-da
pkgver=1.0.9
pkgrel=1
pkgdesc="Danish language pack for Glest"
arch=('any')
url="http://www.glest.org"
license=('GPL')
depends=('glest')
source=(http://www.glest.org/files/contrib/translations/danish_${pkgver}.zip)
md5sums=('10a96d53549c7bd50c842dc9d1bd1592')

build() {
  cd ${srcdir}
  install -D -m 644 *.lng "${pkgdir}/opt/glest/data/lang/danish.lng" || return 1
}
