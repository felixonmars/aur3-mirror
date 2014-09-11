# Maintainer: Paul Staab <develop(at)paulstaab(dot)de>

pkgname=scrm
pkgver=1.2.0
pkgrel=1
pkgdesc="A Coalescent Simulator for Genome-Scale Biological Sequences"
arch=('i686' 'x86_64' 'armv7h')
url="https://scrm.github.io"
license=('GPL3')
depends=('gcc-libs')
makedepends=('gcc>=4.6.3')
checkdepends=('cppunit')
source=("https://scrm.github.io/releases/scrm-$pkgver.tar.gz")
md5sums=('b5cdfee773cee422df1a8348bb2b296b')
sha512sums=('ae4f73858731d22dda70c32f10f60d69ef877f765f0b7ab8df1f686e84137c57140129789b49bb36bb5c2ec3d602f49de70edd5b365b5d6aaf19a4013e464a1e')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k unittests
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
