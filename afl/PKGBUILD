# Maintainer: spider-mario <spidermario@free.fr>
pkgname=afl
pkgver=0.87b
pkgrel=1
pkgdesc="a practical instrumentation-driven fuzzer"
arch=('i686' 'x86_64')
url="http://lcamtuf.coredump.cx/afl/"
license=('Apache')
depends=('glibc')
options=('!emptydirs')
source=(http://lcamtuf.coredump.cx/$pkgname/releases/$pkgname-$pkgver.tgz)
sha512sums=('94e00264825892acdcb91a6098c0bcc74ae86289bd584e63311c7eee72259220dda832fd223980ddb5b5dd1a40e9f4cd3573fa3947001949e10179a390973d9e')

build() {
	cd $pkgname-$pkgver
	make PREFIX=/usr
}

package() {
	cd $pkgname-$pkgver
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
