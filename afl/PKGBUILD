# Maintainer: spider-mario <spidermario@free.fr>
pkgname=afl
pkgver=1.36b
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
sha512sums=('815324c69351aa612e98481ae8477cda8ae41b5ca63c16cba2598dc0ca336ff4a03cfe116dae76eb2067fb65e640fbb8e82d5f82df1eecc0307b0c1f84987aa2')

build() {
	cd $pkgname-$pkgver
	make PREFIX=/usr
}

package() {
	cd $pkgname-$pkgver
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
