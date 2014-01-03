_pkgname=bsdnt
pkgname=bsdnt-git
pkgver=1.0
pkgrel=1
pkgdesc="BSD-licensed Bignum Library"
arch=('i686' 'x86_64')
url="https://github.com/wbhart/bsdnt"
license=('BSD')
source=('git://github.com/wbhart/bsdnt.git#branch=master')
md5sums=('SKIP')

build() {
	cd "$srcdir/$_pkgname"
	./configure --prefix="$pkgdir/usr"
	make
}

package() {
	cd "$srcdir/$_pkgname"

        make install
}
