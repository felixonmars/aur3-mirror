# Maintainer: nidhogg

pkgname=ttf-sahadeva
pkgver=1.0
pkgrel=1
pkgdesc="Free Unicode compliant Devanagari font"
arch=('any')
url="http://bombay.indology.info/software/fonts/devanagari/index.html"
license=('GPL2')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://bombay.indology.info/software/fonts/devanagari/sahadeva.ttf)
md5sums=('03d26165ecf0049e0fb8f4c42a3913cf')

package() {
	mkdir -p $pkgdir/usr/share/fonts/TTF
	cp $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
}
