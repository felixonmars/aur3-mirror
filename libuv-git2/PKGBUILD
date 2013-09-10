# Maintainer: Nick Gamberini <nickelpro@gmail.com>

_pkgname=libuv
pkgname=libuv-git2
pkgver=0.11.13.7.g02e8c8e
pkgrel=1
pkgdesc="A platform layer for node.js, abstracts IOCP on Windows and epoll/kqueue/event ports/etc. on Unix systems"
arch=('i686' 'x86_64')
url="https://github.com/joyent/libuv"
license=('custom')
depends=('glibc')
provides=('libuv')
conflicts=('libuv')
source=('git://github.com/joyent/libuv.git')
md5sums=('SKIP')


pkgver() {
	cd $_pkgname
	git describe --tags | sed 's/^v//;s/-/./g;s/node.v//'
}

build() {
	cd "$srcdir/$_pkgname"
	sh autogen.sh
	./configure --prefix="$pkgdir/usr"

	make
}

check() {
	cd "$srcdir/$_pkgname"

	make test
}

package() {
	cd "$srcdir/$_pkgname"

	make install
	install -Dm644 LICENSE \
		"$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	install -Dm644 AUTHORS \
		"$pkgdir/usr/share/doc/$_pkgname/AUTHORS"
	install -Dm644 README.md \
		"$pkgdir/usr/share/doc/$_pkgname/README.md"

}
