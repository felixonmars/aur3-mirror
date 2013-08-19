# Maintainer: Mihai Militaru <mihai militaru at xmpp dot ro>

pkgname=unqlite
pkgver=1.1.6
digitver=${pkgver//./}
pkgrel=1
pkgdesc="An Embeddable NoSQL Database Engine - lib, bin and doc meta package"
arch=('i686' 'x86_64')
url="http://unqlite.org/"
license=('custom')
source=(license.txt)
md5sums=('07ce5b07d9883b58ea6025d1a18f615f')
depends=('unqlite-lib' 'unqlite-samples' 'unqlite-interp' 'unqlite-doc')

package() {
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	
	cp license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
