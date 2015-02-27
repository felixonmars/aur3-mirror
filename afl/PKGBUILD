# Maintainer: spider-mario <spidermario@free.fr>
pkgname=afl
pkgver=1.50b
pkgrel=2
pkgdesc="a practical instrumentation-driven fuzzer"
arch=('i686' 'x86_64')
url="http://lcamtuf.coredump.cx/afl/"
license=('Apache')
depends=('glibc')
provides=('american-fuzzy-lop')
replaces=('american-fuzzy-lop')
options=('!emptydirs')
source=(http://lcamtuf.coredump.cx/$pkgname/releases/$pkgname-$pkgver.tgz)
sha512sums=('c1eda342a4355a2e6bd4f9ced3b6f5b8d6a674bac329ad13072c7a0547e42db92b28f916d87a55dabd3ef70689b11add3e2a2804eb3b48c340b2de6cf7a77e63')

build() {
	cd $pkgname-$pkgver
	make PREFIX=/usr
}

package() {
	cd $pkgname-$pkgver
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
