# Maintainer: Paul Staab <develop(at)paulstaab(dot)de>

pkgname=scrm
pkgver=1.0.0
pkgrel=1
pkgdesc="A Coalescent Simulator for Genome-Scale Biological Sequences"
arch=('i686' 'x86_64' 'armv7h')
url="https://scrm.github.io"
license=('GPL3')
depends=('gcc-libs')
makedepends=('gcc>=4.6.3')
checkdepends=('cppunit')
source=('https://scrm.github.io/releases/scrm-1.0.0.tar.gz')
md5sums=('2d9868bd8555027959bb30f8255c984a')
sha512sums=('abbd668b911955ef45b6e258c7fa5c776c72fcb66f622915dde51e313165213c4725dffcd36376567c283290366cdedd910185294585b13e3cca2eefdda63317')

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
