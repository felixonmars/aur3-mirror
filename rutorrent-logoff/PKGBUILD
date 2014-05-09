# Maintainer: Martin Herndl <martin.herndl@gmail.com>

pkgname='rutorrent-logoff'
pkgver=1.3
pkgrel=2
pkgdesc='add a log off functionality to ruTorrent'
arch=('any')
url="https://code.google.com/p/rutorrent-logoff"
license=('GPL3')
depends=('rutorrent')
source=("https://rutorrent-logoff.googlecode.com/files/logoff-$pkgver.tar.gz")
sha256sums=('b71d4a0c15cac9fb5cb2c268ddefe1dfab6e1d00c2050ee78fe7e02e49290744')

package() {
	cd "$srcdir/logoff"
	mkdir -p "$pkgdir/usr/share/webapps/rutorrent/plugins/logoff"
	cp -r * "$pkgdir/usr/share/webapps/rutorrent/plugins/logoff"
}
