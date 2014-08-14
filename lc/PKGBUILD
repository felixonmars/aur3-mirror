# Submitter : perlawk
pkgname=lc
pkgver=1.0
pkgrel=1
pkgdesc='lc: A lambda calculus Interpreter'
url='http://stratigery.com/lc.html'
license=('GPL')
arch=('i686' 'x86_64')
makedpends=('clang')
options=(!strip)
source=("http://stratigery.com/$pkgname/$pkgname-$pkgver.tar.gz")

build() {
		cd "$srcdir"/"$pkgname-$pkgver"
		sed -i 's/-Wall/-Wall -O2/' makefile
	 make gnu
}

package() {
		cd "$srcdir"/"$pkgname-$pkgver"
		mkdir -p "$pkgdir"/usr/bin
		cp lc "$pkgdir"/usr/bin/lamcal
}

md5sums=('cd1a3e408eaf15152b924b9f8b55d07b')
