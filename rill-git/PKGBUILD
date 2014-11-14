# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=rill-git
pkgver=r274.c9b606f
pkgrel=1
pkgdesc="A programming language for java sparrow"
arch=('i686' 'x86_64')
url="https://github.com/yutopp/rill"
license=('custom')
depends=('gcc-libs' 'ncurses' 'zlib')
makedepends=('boost' 'clang' 'cmake' 'git')
provides=('rill')
options=('staticlibs')
source=('git+https://github.com/yutopp/rill.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/rill"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/rill"
	cmake -D CMAKE_INSTALL_PREFIX=/usr -D LLVM_CONFIG_PATH=/usr/bin/llvm-config .
	make
}

package() {
	cd "$srcdir/rill"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE_1_0.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}