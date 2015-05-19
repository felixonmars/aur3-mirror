# Maintainer: spider-mario <spidermario@free.fr>
pkgname=afl
pkgver=1.78b
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
sha512sums=('eee0fe81cf15f017d64cf3515597cc097de92204f43ab3042a13e79ecb47ace7dfcbf35903f6c4d4c0db30d9a8e534c23a9670b9b2eb799f8cc14ff9d7b8f2ff')

build() {
	cd $pkgname-$pkgver
	make PREFIX=/usr
}

package() {
	cd $pkgname-$pkgver
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
