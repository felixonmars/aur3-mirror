# Maintainer: spider-mario <spidermario@free.fr>
pkgname=afl
pkgver=1.67b
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
sha512sums=('657c649f122c9afd6d8cef521787fcf8097ef35eb7cd1a6b8e3e3bb93de82ed1c6fabdc5906ab04959d7fcb000e87891ad261a8dff3b701b93b71060832781d2')

build() {
	cd $pkgname-$pkgver
	make PREFIX=/usr
}

package() {
	cd $pkgname-$pkgver
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
