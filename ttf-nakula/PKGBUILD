# Maintainer: nidhogg

pkgname=ttf-nakula
pkgver=1.0
pkgrel=1
pkgdesc="Free Unicode compliant Devanagari font"
arch=('any')
url="http://bombay.indology.info/software/fonts/devanagari/index.html"
license=('GPL2')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://bombay.indology.info/software/fonts/devanagari/nakula.ttf)
md5sums=('e1dbda1ab6ba4f6212901026bd3f9549')

package() {
	mkdir -p $pkgdir/usr/share/fonts/TTF
	cp $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
}
