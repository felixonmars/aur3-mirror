# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=glest-sr
pkgver=2.0.1
pkgrel=1
pkgdesc="Serbian language pack for Glest"
arch=('any')
url="http://www.glest.org"
license=('GPL')
depends=('glest')
source=(http://www.glest.org/files/contrib/translations/srpski_${pkgver}.zip)
md5sums=('c00259c351125138f95c57776a66e3b6')

build() {
  cd ${srcdir}
  install -D -m 644 *.lng "${pkgdir}/opt/glest/data/lang/serbian.lng" || return 1
}
