# Maintainer: Brandon Invergo <brandon@invergo.net>
pkgname=gnu-pw-mgr
pkgver=1.3
pkgrel=1
pkgdesc="Dynamically reconstruct difficult passwords when they are needed"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gnu-pw-mgr"
license=('GPL3')
install=${pkgname}.install
source=(ftp://ftp.gnu.org/gnu/gnu-pw-mgr/$pkgname-$pkgver.tar.gz)
md5sums=('f9d4b22fa479d1e9a844da16134449bd')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
}

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
