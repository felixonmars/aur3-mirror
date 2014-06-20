# Maintainer: Paul Staab <develop(at)paulstaab(dot)de>

pkgname=scrm
pkgver=1.0.b2
pkgrel=1
pkgdesc="A Coalescent Simulator for Genome-Scale Biological Sequences"
arch=('i686' 'x86_64' 'armv7h')
url="https://scrm.github.io"
license=('GPL3')
depends=('gcc-libs')
makedepends=('gcc>=4.6.3')
checkdepends=('cppunit')
source=('https://scrm.github.io/releases/scrm-1.0-beta2.tar.gz')
md5sums=('4a1104cc989782b79ddcb7fd6da96212')
sha512sums=('ac612a5b7744bb829d5accfc1884777710c9e8341fcf4ae8a7f7c99f6be0c3898714e676dadb8df6c39ad0bf383659be4b7cde7263c33c0089d27d5f8ab14a9b')

build() {
	#cd "$srcdir/$pkgname-$pkgver"
	cd "$srcdir/$pkgname-1.0-beta2"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-1.0-beta2"
	make -k unittests
}

package() {
	cd "$srcdir/$pkgname-1.0-beta2"
	make DESTDIR="$pkgdir/" install
}
