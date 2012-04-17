# Maintainer vschigrin <vschigrin@gmail.com>

pkgname=ttf-pt-mono
pkgver=20120417
pkgrel=1
pkgdesc="A set of free public TrueType fonts with support of national alphabets Russia"
arch=('any')
url="http://fonts.ru/public/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf-pt-mono.install
source=(http://www.fontstock.com/public/PTMono.zip)
md5sums=('8a16e3a377a85ae3779b4b55cca62a07')

build() {
  cd "${srcdir}"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/" || return 1
  install -m644 {'PT Free Font License_rus_1.3.txt','PT Free Font License_eng_1.3.txt'} "$pkgdir/usr/share/licenses/$pkgname/" || return 1
}
