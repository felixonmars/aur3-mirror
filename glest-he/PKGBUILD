# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=glest-he
pkgver=1.2.1
pkgrel=1
pkgdesc="Hebrew language pack for Glest"
arch=('any')
url="http://www.glest.org"
license=('GPL')
depends=('glest')
source=(http://www.glest.org/files/contrib/translations/hebrew_${pkgver}.zip)
md5sums=('01cc8f8b53cb77e37de4abbb056a47f1')

build() {
  cd ${srcdir}
  install -D -m 644 *.lng "${pkgdir}/opt/glest/data/lang/hebrew.lng" || return 1
}
