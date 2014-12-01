# Maintainer: spider-mario <spidermario@free.fr>
pkgname=afl
pkgver=0.79b
pkgrel=1
pkgdesc="a practical instrumentation-driven fuzzer"
arch=('i686' 'x86_64')
url="http://lcamtuf.coredump.cx/afl/"
license=('Apache')
depends=('glibc')
options=('!emptydirs')
source=(http://lcamtuf.coredump.cx/$pkgname/releases/$pkgname-$pkgver.tgz)
sha512sums=('1ffad58916c6b11231ff785a4e6862a18a2e96383d8ff5566f8d068cf73282eee03e05ecde02eb0eef762e57171690654083e6c6b47ca1edbd0ec058f50f20fe')

build() {
	cd $pkgname-$pkgver
	make PREFIX=/usr
}

package() {
	cd $pkgname-$pkgver
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
