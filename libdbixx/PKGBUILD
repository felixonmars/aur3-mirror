# Maintainer: Eduardo Sánchez Muñoz <eduardosanchezmunoz@gmail.com>

pkgname=libdbixx
pkgver=0.0.4
pkgrel=1
pkgdesc="DbiXX is general purpose library to execute SQL queries in a safe way."
arch=('i686' 'x86_64')
url="http://cppcms.sourceforge.net/"
license=('LGPL')
depends=('libdbi')
makedepends=('libdbi')
conflicts=('libdbixx')
provides=('libdbixx')
source=("http://ignum.dl.sourceforge.net/project/cppcms/dbixx/$pkgver/dbixx-$pkgver.tar.gz")
md5sums=(e9da6b64f14991fc84e5a64dad7984e7)

build() {	
	cd "$srcdir/dbixx-$pkgver"
	
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/dbixx-$pkgver"
	make DESTDIR="$pkgdir" install
}
