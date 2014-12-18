# Maintainer: spider-mario <spidermario@free.fr>
pkgname=afl
pkgver=0.91b
pkgrel=1
pkgdesc="a practical instrumentation-driven fuzzer"
arch=('i686' 'x86_64')
url="http://lcamtuf.coredump.cx/afl/"
license=('Apache')
depends=('glibc')
options=('!emptydirs')
source=(http://lcamtuf.coredump.cx/$pkgname/releases/$pkgname-$pkgver.tgz)
sha512sums=('cbf8b5ceb6b3ea05771ff386757ab978ef9108de42edff0568c188967e907233f02a5f47701615073f91463621de73059e6401780f611970082142693fdb9fae')

build() {
	cd $pkgname-$pkgver
	make PREFIX=/usr
}

package() {
	cd $pkgname-$pkgver
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
