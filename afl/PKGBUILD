# Maintainer: spider-mario <spidermario@free.fr>
pkgname=afl
pkgver=0.73b
pkgrel=1
pkgdesc="a practical instrumentation-driven fuzzer"
arch=('i686' 'x86_64')
url="http://lcamtuf.coredump.cx/afl/"
license=('Apache')
depends=('glibc')
options=('!emptydirs')
source=(http://lcamtuf.coredump.cx/$pkgname/releases/$pkgname-$pkgver.tgz)
sha512sums=('fec0720aebbc50fe040b0a87e9b6fc9931be3a934f8d8ce34a04c66b3549d7d6fa04005c2de2d4f00408bb4f159e223ef64f13c9b253f72902191f5cd1b65fb7')

build() {
	cd $pkgname-$pkgver
	make PREFIX=/usr
}

package() {
	cd $pkgname-$pkgver
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
