# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=bdf-acapella
pkgver=1.0
pkgrel=1
pkgdesc="Monospaced bitmap typeface inspired by Letter Gothic"
arch=(any)
url="http://www.bsd-dk.dk/~elrond/type/a-capella/"
license=(custom)
install=$pkgname.install
source=("http://www.bsd-dk.dk/%7Eelrond/type/a-capella/files/acapella-$pkgver.tar.gz")
md5sums=('4c61b01dac535a4019fee45ae13b1bf0')

package() {
	cd "$srcdir/acapella-$pkgver"

	# License
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	sed '/This font program is (c)/,/OF SUCH DAMAGE\.$/!d' README > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# Fonts
	install -d "$pkgdir/usr/share/fonts/misc"
	install -m644 -t "$pkgdir/usr/share/fonts/misc/" *.bdf
}
