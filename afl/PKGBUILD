# Maintainer: spider-mario <spidermario@free.fr>
pkgname=afl
pkgver=0.56b
pkgrel=1
pkgdesc="a practical instrumentation-driven fuzzer"
arch=('i686' 'x86_64')
url="https://code.google.com/p/american-fuzzy-lop"
license=('Apache')
depends=('glibc')
options=('!emptydirs')
source=(http://lcamtuf.coredump.cx/soft/$pkgname.tgz)
sha512sums=('8719d33a920774fb776617bd6af22f3727eb790f92400bc4d78acad1eb9fd4dc31dedf06669af9e8475404a548e67f9930112456945c6746837af7f47b2e3be9')

build() {
	cd $pkgname-$pkgver
	make PREFIX=/usr
}

package() {
	cd $pkgname-$pkgver

	make PREFIX=/usr DESTDIR="$pkgdir" install

	install --directory "$pkgdir"/usr/share/doc/
	cp --recursive docs "$pkgdir"/usr/share/doc/$pkgname
	find "$pkgdir"/usr/share/doc/$pkgname -type f -exec chmod 644 -- '{}' +
}
