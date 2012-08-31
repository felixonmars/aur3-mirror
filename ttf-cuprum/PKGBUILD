#Maintainer vschigrin <vschigrin@gmail.com>

pkgname=ttf-cuprum
pkgver=20120409
pkgrel=2
pkgdesc="A free public font Cuprum"
arch=('any')
url="http://jovanny.ru/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf-cuprum.install
source=(http://jovanny.ru/fonts/Cuprum_typefamily.zip)
md5sums=('1bdccb6f0ce6786a49d2b1417f76f90a')

build() {
  cd "${srcdir}"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/" || return 1
  install -m644 'OFL.txt' "$pkgdir/usr/share/licenses/$pkgname/" || return 1
}
