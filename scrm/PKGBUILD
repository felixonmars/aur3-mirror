# Maintainer: Paul Staab <develop(at)paulstaab(dot)de>

pkgname=scrm
pkgver=1.3.2
pkgrel=1
pkgdesc="A Coalescent Simulator for Genome-Scale Biological Sequences"
arch=('i686' 'x86_64' 'armv7h')
url="https://scrm.github.io"
license=('GPL3')
depends=('gcc-libs')
makedepends=('gcc>=4.8.1')
checkdepends=('cppunit')
source=("https://scrm.github.io/releases/scrm-$pkgver.tar.gz")
md5sums=('a6887d63f28a4debfa9fbb71b7134519')
sha512sums=('54cf79b17434f9aceee3998ec6ec2c97acc68a4f914d08a37a51ab2cfb9d4ffd5792147babbe9426b2540aa9a1e1369730a84384e2259bd4e8c3eb9fc3edc448')

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
