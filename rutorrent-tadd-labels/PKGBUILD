pkgname='rutorrent-tadd-labels'
pkgver=0.8.1
pkgrel=1
pkgdesc='ruTorrent plugin adding a labels drop-down to the new torrent dialog'
arch=('any')
url="https://code.google.com/p/rutorrent-tadd-labels/"
license=('GPL3')
depends=('rutorrent')
source=("https://rutorrent-tadd-labels.googlecode.com/files/lbll-suite_$pkgver.tar.gz")
sha1sums=('dba315d83b07eeca68e5c4b306607e8bb1687f70')

package() {
	cd "$srcdir/lbll-suite"
	mkdir -p "$pkgdir/usr/share/webapps/rutorrent/plugins/lbll-suite"
	cp -r * "$pkgdir/usr/share/webapps/rutorrent/plugins/lbll-suite"
}

