# Maintainer: spider-mario <spidermario@free.fr>
pkgname=afl
pkgver=1.28b
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
sha512sums=('a7e21a457bdd5c74ca48550b3e4c08c0c9800dde5e30313a8c83dba306d848ab31e1f740aa7e18ebb4736384040b75546bedb147f7f88a718307387c5558c8b5')

build() {
	cd $pkgname-$pkgver
	make PREFIX=/usr
}

package() {
	cd $pkgname-$pkgver
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
