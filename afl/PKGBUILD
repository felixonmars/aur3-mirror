# Maintainer: spider-mario <spidermario@free.fr>
pkgname=afl
pkgver=1.59b
pkgrel=1
pkgdesc="a practical instrumentation-driven fuzzer"
arch=('i686' 'x86_64')
url="http://lcamtuf.coredump.cx/afl/"
license=('Apache')
depends=('glibc')
provides=('american-fuzzy-lop')
replaces=('american-fuzzy-lop')
options=('!emptydirs')
source=(http://lcamtuf.coredump.cx/$pkgname/releases/$pkgname-$pkgver.tgz)
sha512sums=('bc956d2aae5716dd7a6b7a69eaaae911b88bf73883aa7d6ddc0dc7709399bae419595be252b17430024bc70087eac2f3fb46522c63b19af609ab6261f5212ef6')

build() {
	cd $pkgname-$pkgver
	make PREFIX=/usr
}

package() {
	cd $pkgname-$pkgver
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
