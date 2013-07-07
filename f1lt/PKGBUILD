# Maintainer: andreas_baumann <abaumann at yahoo dot com>
pkgname=f1lt
pkgver=2.1.1
pkgrel=1
pkgdesc="unofficial Formula 1 live timing application"
arch=('i686' 'x86_64')
url="http://f1lt.pl"
license=('GPL3')
depends=('qt4')
makedepends=('git')
source=("http://$pkgname.googlecode.com/files/$pkgname-$pkgver-src.tar.gz")
md5sums=('1c0d350f1c1dc017dece4f4faf4b5360')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	qmake-qt4
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install
}
