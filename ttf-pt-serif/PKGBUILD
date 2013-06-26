# Maintainer IIIcyg <IIIcyg@gmail.com>

pkgname=ttf-pt-serif
pkgver=20110612
pkgrel=1
pkgdesc="A set of free public TrueType fonts with support of national alphabets Russia"
arch=('any')
url="http://fonts.ru/public/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf-pt-serif.install
source=(http://www.fontstock.com/public/PTSerif.zip)
md5sums=('222c58a038c6660f2ecf429c6c34d5d4')

build() {
  cd "${srcdir}"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/" || return 1
  install -m644 {'PT Free Font License_rus_1.2.txt','PT Free Font License_eng_1.2.txt'} "$pkgdir/usr/share/licenses/$pkgname/" || return 1
}
