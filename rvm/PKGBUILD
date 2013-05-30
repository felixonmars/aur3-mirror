# Maintainer: Daniel Kirchner <daniel@ekpyron.org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Karol Maciaszek <karol.maciaszek@gmail.com>
# Contributor: wooptoo <wooptoo@gmail.com>

pkgname=rvm
pkgver=1.17
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="Recoverable Virtual Memory library for CODA"
url="http://www.coda.cs.cmu.edu/"
options=(!libtool)
license=('GPL')
depends=(lwp)
makedepends=()
source=(http://www.coda.cs.cmu.edu/pub/$pkgname/src/$pkgname-$pkgver.tar.gz)
md5sums=(208486ed214c254280a6c23f8f5599bd)

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr --with-pic
	make || return 1
}

package() {
	cd $startdir/src/$pkgname-$pkgver
	make DESTDIR=$pkgdir install
}
