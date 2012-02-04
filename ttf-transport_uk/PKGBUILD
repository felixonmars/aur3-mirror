# Contributor: Lee Jackson <tomoe AT lbjackson DOTCOM>
pkgname=ttf-transport_uk
pkgver=1.0
pkgrel=1
pkgdesc="A sans serif typeface designed for road signs in the United Kingdom"
arch=('i686' 'x86_64')
url="http://www.urbanfonts.com/fonts/Transport.htm"
license=('unknown')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('fontforge')
install=ttf.install
source=(http://www.urbanfonts.com/fonts/download/transport_uk.zip)

md5sums=('da76539a8152096d021457ae02f54fbb')

build() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 *.ttf "$pkgdir/usr/share/fonts/TTF"
}
