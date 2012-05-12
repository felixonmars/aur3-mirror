# Maintainer : sebikul <sebikul@gmail.com>

pkgname=freecode-submit
pkgver=2.3
pkgrel=2
pkgdesc="freecode-submit is a script that supports remote submission of release updates to Freecode via its JSON API"
arch=(any)
url="http://www.catb.org/~esr/freecode-submit/"
license=('GPL')
depends=('python')

source=(http://www.catb.org/~esr/freecode-submit/$pkgname-$pkgver.tar.gz)
md5sums=('e2d0e5938d8186168a9af017357d4ebc')

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	
	install -Dm755 freecode-submit $pkgdir/usr/bin/freecode-submit
	install -Dm644 freecode-submit.1 $pkgdir/usr/share/man/man1/freecode-submit.1
	install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENCE
}