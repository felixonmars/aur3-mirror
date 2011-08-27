# Contributor: wido <widomaker2k7@gmail.com>

pkgname=opera-devel-fr
pkgver=11.00.1055
pkgrel=2
pkgdesc="Language french for Opera 11"
arch=('any')
license=('custom:opera')
url="http://www.opera-fr.com/"
depends=("opera-devel")
#source=(http://opera-fr.com/pierre/lng/11.x/french.lng)
source=(french.lng)

build() {
  cd ${startdir}/src
  install -D -m 644 french.lng ${pkgdir}/usr/share/opera-devel/locale/fr/french.lng || return 1
}
md5sums=('676d0cc57896e00ea802bef9c655bfc9')
