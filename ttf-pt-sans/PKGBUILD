# Maintainer Kovivchak Evgen <oneonfire@gmail.com>

pkgname=ttf-pt-sans
pkgver=20110102
pkgrel=1
pkgdesc="A set of free public TrueType fonts with support of national alphabets Russia"
arch=('any')
url="http://fonts.ru/public/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf-pt-sans.install
source=(http://www.fontstock.com/public/PTSans.zip)
md5sums=('2d37d5103130c8a4839bf73ffa42d223')

build() {
  cd "${srcdir}"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/" || return 1
  install -m644 {'PT Free Font License_rus_1.2.txt','PT Free Font License_eng_1.2.txt'} "$pkgdir/usr/share/licenses/$pkgname/" || return 1
}
