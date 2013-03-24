# Maintainer: graysky <graysky AT archlinux DOT us>
pkgname=ppastats
pkgver=0.2
pkgrel=2
pkgdesc="Util to download PPA statistics from launchpad."
arch=(any)
url="https://gitorious.org/arand-scripts"
license=('MIT')
depends=('python2' 'launchpadlib>=1.10')
source=("$url/arand-scripts/blobs/raw/$pkgname-$pkgver/$pkgname"
"$url/arand-scripts/blobs/master/COPYING")
sha256sums=('85792b55c1989fd026e88c8fcb6ad49f0cd287e8e2e731ef66924b4774daef72'
            'a2ca92a347439e5054b35d762c89e09bec1949dd2793720d9de705e6c2831502')

package() {
	sed -i 's/^#!\/usr\/bin\/python/#!\/usr\/bin\/python2/' $pkgname
	install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
