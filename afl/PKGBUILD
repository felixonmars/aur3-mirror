# Maintainer: spider-mario <spidermario@free.fr>
pkgname=afl
pkgver=1.71b
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
sha512sums=('cbc5d22c9b3c477d1bad6c757267728c6530ab9b55a6b1e413f5f209250cd95fc38cc5b438215e8a05627ec551e98220372db64357124ffeaaacc0bdef2245da')

build() {
	cd $pkgname-$pkgver
	make PREFIX=/usr
}

package() {
	cd $pkgname-$pkgver
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
