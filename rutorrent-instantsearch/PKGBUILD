pkgname='rutorrent-instantsearch'
pkgver=1.0
pkgrel=1
pkgdesc='ruTorrent plugin to instantly show search results as you type'
arch=('any')
url="https://code.google.com/p/rutorrent-instantsearch"
license=('GPL3')
depends=('rutorrent')
source=("https://rutorrent-instantsearch.googlecode.com/files/instantsearch.$pkgver.zip")
sha1sums=('679048d28d4a0dba3a3e98c5c93a09b010005e7a')

package() {
	cd "$srcdir/instantsearch"
	rm -rf .svn
	mkdir -p "$pkgdir/usr/share/webapps/rutorrent/plugins/instantsearch"
	cp -r * "$pkgdir/usr/share/webapps/rutorrent/plugins/instantsearch"
}

