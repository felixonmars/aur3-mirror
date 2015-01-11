# Maintainer: spider-mario <spidermario@free.fr>
pkgname=afl
pkgver=1.08b
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
sha512sums=('eb637a1e5583fdeb3a9b68f9088a3cecd7a77f65b47f37b735217343de6b87b52db6819a24efe4514d4f1a57b83503e5261227d3cb5acb506ff05d876bd25bd0')

build() {
	cd $pkgname-$pkgver
	make PREFIX=/usr
}

package() {
	cd $pkgname-$pkgver
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
