# Maintainer: Andreas Wagner <AndreasBWagner@pointfree.net>
pkgname=libstree
pkgver=0.4.3
pkgrel=1
epoch=
pkgdesc="A generic suffix tree library"
arch=('i686' 'x86_64')
url="http://www.icir.org/christian/libstree/"
license=('BSD')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.icir.org/christian/downloads/${pkgname}-${pkgver}-pre2.tar.gz")
sha512sums=('feedffe0c50622108b8cdb5af8d87311c604069d5ce3691c550d35827c6d466b1618ff60ea4bcd6c470d1da86003305b3a3919d9e6613051009c4dd2030e2a1d')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
