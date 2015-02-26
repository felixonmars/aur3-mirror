# Maintainer: spider-mario <spidermario@free.fr>
pkgname=afl
pkgver=1.50b
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
sha512sums=('f2638dfdf765167fb8ce5b7e559183f28b645f0818b9c0968d71dc423edbbb257ccb844de8f2530f3b94e311ed460a4d606d9b07ac4d674a379f367f399f3319')

build() {
	cd $pkgname-$pkgver
	make PREFIX=/usr
}

package() {
	cd $pkgname-$pkgver
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
