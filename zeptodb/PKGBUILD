# Maintainer: Brandon Invergo <brandon@invergo.net>
pkgname=zeptodb
pkgver=2.0.2b
pkgrel=1
pkgdesc="Tiny command-line tools for manipulating DBM databases"
arch=('i686' 'x86_64')
url="http://zeptodb.invergo.net/"
license=('GPL3')
depends=('gdbm')
optdepends=('kyotocabinet')
install='zeptodb.install'
source=("http://zeptodb.invergo.net/download/$pkgname-$pkgver.tar.gz")
md5sums=('7b33dea048aec7da50be6ffe6b60153e')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    make check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
