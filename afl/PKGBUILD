# Maintainer: spider-mario <spidermario@free.fr>
pkgname=afl
pkgver=0.60b
pkgrel=1
pkgdesc="a practical instrumentation-driven fuzzer"
arch=('i686' 'x86_64')
url="https://code.google.com/p/american-fuzzy-lop"
license=('Apache')
depends=('glibc')
options=('!emptydirs')
source=(http://lcamtuf.coredump.cx/soft/$pkgname.tgz)
sha512sums=('fed3bf1b241e75d1c2840bacb70b079351e3880acb6acb8a344513318b8f28d41dd919db081506b4930617ae8261053e26e45d1e3875d402e8591fa43e9fcd16')

build() {
	cd $pkgname-$pkgver
	make PREFIX=/usr
}

package() {
	cd $pkgname-$pkgver
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
