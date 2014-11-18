# Maintainer: spider-mario <spidermario@free.fr>
pkgname=afl
pkgver=0.52b
pkgrel=1
pkgdesc="a practical instrumentation-driven fuzzer"
arch=('i686' 'x86_64')
url="https://code.google.com/p/american-fuzzy-lop"
license=('Apache')
depends=('glibc')
options=('!strip')
source=(http://lcamtuf.coredump.cx/soft/$pkgname.tgz)
sha512sums=('4e0fb27e659b6313a4ce6c7a70d77525f49a0ce6c5ba1293499629f85b548b1339538152f9f2873c3e8fcc527299ba612719546f92f1e67133a3b48282c0adb4')

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
