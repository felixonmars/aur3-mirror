# Maintainer: Daniel Funke <daniel.funke@student.kit.edu>
pkgname=igprof
pkgver=5.9.11
pkgrel=1
pkgdesc="A simple tool for measuring and analysing application memory and performance characteristics"
arch=('i686' 'x86_64')
url="http://igprof.org/index.html"
license=('GPL')
groups=()
depends=('libatomic_ops'
		 'libunwind'
		 'pcre'
		 'python')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::https://github.com/ktf/igprof/archive/v$pkgver.tar.gz)
md5sums=('0151d46573fc452151d2fd8662bfe5dd')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_CXX_FLAGS_RELWITHDEBINFO="-g -O3" .
	make 	
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
