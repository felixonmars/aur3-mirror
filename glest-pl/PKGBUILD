# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=glest-pl
pkgver=1.0.9
pkgrel=1
pkgdesc="Polish language pack for Glest"
arch=('any')
url="http://www.glest.org"
license=('GPL')
depends=('glest')
source=(http://www.glest.org/files/contrib/translations/polish_${pkgver}.zip)
md5sums=('977df518ef4523fce1e833769e760e29')

build() {
  cd ${srcdir}
  install -D -m 644 *.lng "${pkgdir}/opt/glest/data/lang/polish.lng" || return 1
}
