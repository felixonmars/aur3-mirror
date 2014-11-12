# Maintainer: Guillermo Ramos <0xwille at gmail dot com>

pkgname="radare2"
pkgver=0.9.8
pkgrel=1
pkgdesc="Open-source tools to disasm, debug, analyze and manipulate binary files"
arch=('i686' 'x86_64')
url="http://radare.org"
license=('GPL3' 'LGPL3')
optdepends=('bash' 'python')
source=("$url/get/$pkgname-$pkgver.tar.xz")
md5sums=("724d3a281ebb0f8c7da5a09c125e5663")
sha256sums=("8e72caaebdac10300fd7ec86a5d06b1cbecfc6914e5fea4007c6e06e667bfa5a")

build() {
	cd "$pkgname-$pkgver"
	export LDFLAGS="${LDFLAGS//-Wl,--as-needed}"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR=$pkgdir install
	install -D -m644 man/* "$pkgdir/usr/share/man/man1"
}
