# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=libcrafter-git
pkgver=r179.3bdaa9b
pkgrel=1
pkgdesc="A high level C++ network packet sniffing and crafting library"
arch=('i686' 'x86_64')
url="https://code.google.com/p/libcrafter/"
license=('BSD')
depends=('gcc-libs' 'libpcap')
makedepends=('git')
provides=('libcrafter')
source=('git+https://github.com/pellegre/libcrafter.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/libcrafter"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/libcrafter/libcrafter"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/libcrafter/libcrafter"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}