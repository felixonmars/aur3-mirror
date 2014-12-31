# Maintainer: spider-mario <spidermario@free.fr>
pkgname=afl
pkgver=1.06b
pkgrel=1
pkgdesc="a practical instrumentation-driven fuzzer"
arch=('i686' 'x86_64')
url="http://lcamtuf.coredump.cx/afl/"
license=('Apache')
depends=('glibc')
options=('!emptydirs')
source=(http://lcamtuf.coredump.cx/$pkgname/releases/$pkgname-$pkgver.tgz)
sha512sums=('0cacd18701b328baa092f113b6ca90b051bd7c99f8176c607e24528b752adc18d2345d42c6d489c441aa7f193200f370d6d8c5fc56f441c2a9272d1cca18b69c')

build() {
	cd $pkgname-$pkgver
	make PREFIX=/usr
}

package() {
	cd $pkgname-$pkgver
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
