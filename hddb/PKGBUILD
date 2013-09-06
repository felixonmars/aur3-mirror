# Maintainer: Louis-Guillaume Gagnon <louis.guillaume.gagnon@gmail.com>
pkgname=hddb
pkgver=1.0.0
pkgrel=1
pkgdesc="The simple Haskell Document Database"
arch=('x86_64' 'i686')
url="https://github.com/gagnonlg/hddb"
license=('GPL3+')
depends=('sqlite3')
makedepends=('ghc' 'haskell-hdbc-sqlite3')
source=(https://sites.google.com/site/${pkgname}stable/home/${pkgname}-${pkgver}.tar.xz)
md5sums=('74c33534ec12108a1e499a5fa0d5f8fc')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR="$pkgdir/" install
}
