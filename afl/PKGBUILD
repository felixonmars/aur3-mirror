# Maintainer: spider-mario <spidermario@free.fr>
pkgname=afl
pkgver=0.75b
pkgrel=1
pkgdesc="a practical instrumentation-driven fuzzer"
arch=('i686' 'x86_64')
url="http://lcamtuf.coredump.cx/afl/"
license=('Apache')
depends=('glibc')
options=('!emptydirs')
source=(http://lcamtuf.coredump.cx/$pkgname/releases/$pkgname-$pkgver.tgz)
sha512sums=('a76697d53aceeff1ae9e8985e4f08fbc9f64e4ee76ec2c466d431b3773d7087a4f299831c94d05cc1c5ef92e17d606534a82cee289246141e5633a0dc0b7af4c')

build() {
	cd $pkgname-$pkgver
	make PREFIX=/usr
}

package() {
	cd $pkgname-$pkgver
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
