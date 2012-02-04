# Contributor: Lee Jackson <tomoe AT lbjackson DOTCOM>
pkgname=ttf-heineken
pkgver=1.0
pkgrel=1
pkgdesc="Shamrock's clone of a rather famous beverage brand's font"
arch=('i686' 'x86_64')
url="http://www.shamrocking.com"
license=('unknown')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('fontforge')
install=ttf.install
source=(http://www.shamrocking.com/hein.zip)

md5sums=('5d4cfea58a15f195b2f155354b25a020')

build() {
  cd "$srcdir/heineken.ttf"
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 *.TTF "$pkgdir/usr/share/fonts/TTF"
}
