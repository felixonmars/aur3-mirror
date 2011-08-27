# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=glest-fr
pkgver=3.1.2
pkgrel=1
pkgdesc="French language pack for Glest"
arch=('any')
url="http://www.glest.org"
license=('GPL')
depends=('glest')
source=(http://www.glest.org/files/contrib/translations/fran%e7ais_${pkgver}.zip)
md5sums=('8446f46d9b894ede3ace90edac8663d7')

build() {
  cd ${srcdir}
  install -D -m 644 *.lng "${pkgdir}/opt/glest/data/lang/francais.lng" || return 1
}
