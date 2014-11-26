# Maintainer: spider-mario <spidermario@free.fr>
pkgname=afl
pkgver=0.69b
pkgrel=1
pkgdesc="a practical instrumentation-driven fuzzer"
arch=('i686' 'x86_64')
url="http://lcamtuf.coredump.cx/afl/"
license=('Apache')
depends=('glibc')
options=('!emptydirs')
source=(http://lcamtuf.coredump.cx/$pkgname/releases/$pkgname-$pkgver.tgz)
sha512sums=('8e86ff4597e00cb3297e4c413d40a4ee75fdbf1422dd081fd3739da26c8300076b58392a0097a4f35857be10ed82d66dbb4785b1bdb686e59e0db86d3130820c')

build() {
	cd $pkgname-$pkgver
	make PREFIX=/usr
}

package() {
	cd $pkgname-$pkgver
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
