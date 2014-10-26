# Maintainer: Paul Staab <develop(at)paulstaab(dot)de>

pkgname=scrm
pkgver=1.3.1
pkgrel=1
pkgdesc="A Coalescent Simulator for Genome-Scale Biological Sequences"
arch=('i686' 'x86_64' 'armv7h')
url="https://scrm.github.io"
license=('GPL3')
depends=('gcc-libs')
makedepends=('gcc>=4.8.1')
checkdepends=('cppunit')
source=("https://scrm.github.io/releases/scrm-$pkgver.tar.gz")
md5sums=('244a15a16007096b3b2e45b24180179d')
sha512sums=('c079eac6e15d1c63de0815956f4cd8c7e4b3e9521d3e1b94193f26897283e540f242ef3b4bdb0c6f6eefed64f30e025abe310de04f50c762bfc99564856520db')

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
