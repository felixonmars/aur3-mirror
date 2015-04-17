# Maintainer: spider-mario <spidermario@free.fr>
pkgname=afl
pkgver=1.69b
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
sha512sums=('8ee60985d35028f9eb984d74c863cb63f0943a4a99aa4a177c5a01db6be17b6ab295f99beee557b3a189947dcd26926748b063b5ee75ba2a2cd5a2e4b3f17348')

build() {
	cd $pkgname-$pkgver
	make PREFIX=/usr
}

package() {
	cd $pkgname-$pkgver
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
