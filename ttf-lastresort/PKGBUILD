# Contributor: solsTiCe d'Hiver <solstice.dhiver@gmail.com>

pkgname=ttf-lastresort
pkgver=1
pkgrel=2
pkgdesc="a last resort unicode font to know visually what font you are missing"
arch=(any)
url="http://www.unicode.org/policies/lastresortfont_eula.html"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf-lastresort.install
source=(http://www.unicode.org/cgi-bin/LastResortDownload.zip LICENSE)
md5sums=('ab320d97b07c47a7a0b6139ea5da0ba1' '1b7ddce3b8c0025e0d9a7a2c381444fc')

package() {
	cd $srcdir
	mkdir -p $pkgdir/usr/share/{licenses/$pkgname,fonts/TTF}
	install -m 644 LastResort.ttf $pkgdir/usr/share/fonts/TTF
	install -m 644 LICENSE $pkgdir/usr/share/licenses/$pkgname
}

