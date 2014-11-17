# Maintainer: spider-mario <spidermario@free.fr>
pkgname=afl
pkgver=0.50b
pkgrel=1
pkgdesc="a practical instrumentation-driven fuzzer"
arch=('i686' 'x86_64')
url="https://code.google.com/p/american-fuzzy-lop"
license=('Apache')
depends=('glibc')
options=('!strip')
source=(http://lcamtuf.coredump.cx/soft/$pkgname.tgz)
sha512sums=('b6e4e82cb4fa455623d200fccfb021bbb8611cd1732d1c00ea8ca14158df01ad8e1fa1d8947f2b13b6b784411430727ea45b1de94e60417e8669eee1c50a2efa')

prepare() {
	cd $pkgname-$pkgver
	perl -pe 's{/usr/local}{/usr}g' -i Makefile
}

build() {
	cd $pkgname-$pkgver
	make
}

package() {
	cd $pkgname-$pkgver

	install --directory "$pkgdir"/usr/{bin,lib/$pkgname}

	make DESTDIR="$pkgdir" install
	strip -- "$pkgdir"/usr/bin/*

	install --directory "$pkgdir"/usr/share/doc/
	cp --recursive docs "$pkgdir"/usr/share/doc/$pkgname
	find "$pkgdir"/usr/share/doc/$pkgname -type f -exec chmod 644 -- '{}' +
}
