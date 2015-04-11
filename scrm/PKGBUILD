# Maintainer: Paul Staab <develop(at)paulstaab(dot)de>

pkgname=scrm
pkgver=1.5.0
pkgrel=1
pkgdesc="A Coalescent Simulator for Genome-Scale Biological Sequences"
arch=('i686' 'x86_64' 'armv7h')
url="https://scrm.github.io"
license=('GPL3')
depends=('gcc-libs')
makedepends=('gcc>=4.8.1')
checkdepends=('cppunit')
source=("https://scrm.github.io/releases/scrm-$pkgver.tar.gz")
sha512sums=('15f7f7280b3c9dfa988953ba991898b9d058f7e9d0337d8b2c7fb05e37f0064237e0c1e56959f08a6d31ad84094db129cb2280cd56d5e35d59e4467e3c2c9cd3')
md5sums=('09fdc94750d720e8e62e4e9489e1e8c8')

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
