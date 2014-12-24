# Maintainer: Nick Gamberini <nickelpro@gmail.com>

_pkgname=libuv
pkgname=libuv-git
pkgver=1.0.1.67.gfcb2223
pkgrel=1
pkgdesc="Multi-platform support library with a focus on asynchronous I/O"
arch=('i686' 'x86_64')
url="https://github.com/libuv/libuv"
license=('custom')
depends=('glibc')
makedepends=('git')
provides=('libuv')
conflicts=('libuv')
source=('git://github.com/libuv/libuv.git')
md5sums=('SKIP')


pkgver() {
	cd $_pkgname
	git describe --tags | sed 's/^v//;s/-/./g;s/node.v//'
}

build() {
	cd "$srcdir/$_pkgname"
	sh autogen.sh
	./configure --prefix="/usr"
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE \
		"$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	install -Dm644 AUTHORS \
		"$pkgdir/usr/share/doc/$_pkgname/AUTHORS"
	install -Dm644 README.md \
		"$pkgdir/usr/share/doc/$_pkgname/README.md"
}
