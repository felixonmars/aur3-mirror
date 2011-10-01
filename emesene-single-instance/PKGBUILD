# Contributor: Jeremy Newton (Mystro256)

pkgname=emesene-single-instance
pkgver=1.0
pkgrel=1
pkgdesc="Adds a launcher that opens a running instance of emesene rather than starting a new one each time it's launched, which is more like the behaviour of the official client"
url="http://blog.emesene.org"
depends=('emesene>=2.11.8')
source=('emesene-single.desktop')
license=('GPL')
arch=('any')
md5sums=('54c028870bd0918837c64bda166dde13')
build() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/applications"
	cp emesene-single.desktop $pkgdir/usr/share/applications
}
