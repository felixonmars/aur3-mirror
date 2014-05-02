# Maintainer: scorici <scorici AT yahoo DOT com>
# Contributor: Felipe Schneider <dudektria@devio.us>

pkgname=pgn-extract
pkgver=17_14
pkgrel=1
pkgdesc='Portable Game Notation (PGN) Manipulator for Chess Games'
arch=('any')
url='http://www.cs.kent.ac.uk/people/staff/djb/pgn-extract/'
license=('GPL')
depends=('glibc')
source=("ftp://ftp.cs.kent.ac.uk/pub/djb/Extract/${pkgname}-${pkgver//_/-}.tgz")
md5sums=('37d6487e0c69df006486b080d3e93630')

build() {
	cd "$srcdir/${pkgname}"
	make
}

package() {
	cd "$srcdir/${pkgname}"
	install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}"
	install -Dm644 help.html "$pkgdir/usr/share/doc/${pkgname}/help.html"
	install -Dm644 eco.pgn "$pkgdir/usr/share/${pkgname}/eco.pgn"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
}
