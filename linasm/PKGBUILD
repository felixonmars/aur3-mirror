# Maintainer: Jack Black <ezamlinsky@gmail.com>
pkgname=linasm
pkgver=1.1
pkgrel=1
pkgdesc="LinAsm library"
arch=('x86_64')
url="http://linasm.sourceforge.net/"
license=('GPL3')
depends=('')
makedepends=('git')
source=("$pkgname-$pkgver::git://git.code.sf.net/p/linasm/linasm#commit=ef7f600")
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" prefix="/usr" install
}
