# Maintainer: spider-mario <spidermario@free.fr>
pkgname=afl
pkgver=1.47b
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
sha512sums=('243bd09aa2ae312ae1d184cbe7ec1cb8c87852b956ce51cfca223f36fb01db29deb25a9cc1e8a8d3281c3a2e845a5ae52b9480ac7e15cc6bbbd7d3a5eb294059')

build() {
	cd $pkgname-$pkgver
	make PREFIX=/usr
}

package() {
	cd $pkgname-$pkgver
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
