# Maintainer: spider-mario <spidermario@free.fr>
pkgname=afl
pkgver=1.57b
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
sha512sums=('87d29ee22c7d097c672c106cc2eeac2fa26de646f2539e46444640c836887f8a4c7188e7bc30ab43d1a94b340bd55aaeea25171531d09331393395b0156e9cda')

build() {
	cd $pkgname-$pkgver
	make PREFIX=/usr
}

package() {
	cd $pkgname-$pkgver
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
